#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <ctype.h>
#include <stdbool.h>

#define MAX_BANK 0xF

uint8_t getNibble(char ascii) {
   uint8_t nibble = 0;
   if (ascii >= '0' && ascii <= '9') {
      nibble = (uint8_t)(ascii - '0');
   } else if (toupper(ascii) >= 'A' || toupper(ascii) <= 'F') {
      nibble = (uint8_t)(toupper(ascii) - 'A') + 0xA;
   }

   return nibble;
}

void main(int argc, char **argv) {
   FILE *ifp;
   FILE *ofp;

   int address;
   int bank;
   int offset;
   char idata[258]; // Max 256 ASCII characters + end of line and null terminator
   uint8_t odata;
   int i;
   uint8_t nibble;
   int line;
   int bytes;
   int iline;
   bool first;

   if (argc < 4) {
      printf("Usage: %s [source ASCII file] [converted BASIC file] [VRAM load address - 20-bit hex] [starting BASIC line]\n", argv[0]);
      return;
   }

   ifp = fopen(argv[1], "r");
   if (ifp == NULL) {
      printf("Error opening %s for reading\n", argv[1]);
      return;
   }
   ofp = fopen(argv[2], "w");
   if (ofp == NULL) {
      printf("Error opening %s for writing\n", argv[2]);
      return;
   }

   sscanf(argv[3],"%x",&address);
   bank = (address & 0xF0000) >> 16;
   offset = address & 0x0FFFF;

   if (argc >= 5) {
      line = atoi(argv[4]);
   } else {
      line = 1000;
   }

   iline = 0;
   while (!feof(ifp)) {
      if (fgets(idata, 256, ifp) != NULL) {
         iline++;
         if (idata[0] != '#') {
            if (bank > MAX_BANK) {
               printf("ERROR: %s data exceeds VRAM capacity when loading at %s, stopping\n", argv[1], argv[3]);
               return;
            }
            i = 0;
            bytes = 0;
            first = true;
            fprintf(ofp, "%d DATA ", line);
            while ((idata[i] >= ' ') && (idata[i] != '#')) {
               if (idata[i] == ' ') {
                  i++;
               } else {
                  if ((bytes > 0) && (bytes % 8 == 0)) {
                     line++;
                     fprintf(ofp,"\n%d DATA ", line);
                     first = true;
                  }
                  nibble = getNibble(idata[i]);
                  odata = nibble << 4;
                  nibble = getNibble(idata[i+1]);
                  odata = odata | nibble;
                  if (!first) {
                     fprintf(ofp,",");
                  }
                  fprintf(ofp,"$%02X",odata);
                  i += 2;
                  bytes++;
                  first = false;
               }
            }
            line++;
            if ((offset + bytes) > 0xFFFF) {
               printf("WARNING: %s line %d spans two VRAM banks, splitting\n", argv[1], iline);
               fprintf(ofp, "\n%d FOR I=0 to %d: READ B: VPOKE $%X,$%04X+I,B: NEXT I\n", line, 0xFFFF-offset, bank, offset);
               bank++;
               bytes = bytes - (0x10000 - offset);
               offset = 0x0000;
               line++;
               fprintf(ofp, "%d FOR I=0 TO %d: READ B: VPOKE $%X,$%04X+I,B: NEXT I\n", line, bytes-1, bank, offset);
               offset += bytes;
            } else {
               fprintf(ofp, "\n%d FOR I=0 TO %d: READ B: VPOKE $%X,$%04X+I,B: NEXT I\n", line, bytes-1, bank, offset);
               offset += bytes;
               if (offset > 0xFFFF) {
                  offset = 0;
                  bank++;
               }
            }
            line++;
         }
      }
   }

   fclose(ifp);
   fclose(ofp);
}
