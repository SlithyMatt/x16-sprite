#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <ctype.h>

char getNibble(char ascii) {
   char nibble = 0;
   if (ascii >= '0' || ascii <= '9') {
      nibble = ascii - '0';
   } else if (toupper(ascii) >= 'A' || toupper(ascii) <= 'F') {
      nibble = toupper(ascii) - 'A' + 0xA;
   }

   return nibble;
}

void main(int argc, char **argv) {
   FILE *ifp;
   FILE *ofp;

   int address;
   char idata[258]; // Max 256 ASCII characters + end of line and null terminator
   uint8_t odata;
   int i;
   char nibble;

   if (argc < 3) {
      printf("Usage: %s [source ASCII file] [converted binary file] [default load address]\n", argv[0]);
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

   if (argc >= 4) {
      sscanf(argv[3],"%x",&address);
   } else {
      // set default load address to 0x0000
      address = 0x0000;
   }

   odata = (uint8_t) (address & 0x00FF);
   fwrite(&odata,1,1,ofp);
   odata = (uint8_t) ((address & 0xFF00) >> 8);
   fwrite(&odata,1,1,ofp);

   while (!feof(ifp)) {
      if (fgets(idata, 256, ifp) != NULL) {
         if (idata[0] != '#') {
            i = 0;
            while (idata[i] >= ' ') {
               nibble = getNibble(idata[i]);
               odata = nibble << 4;
               nibble = getNibble(idata[i+1]);
               odata = odata | nibble;
               fwrite(&odata,1,1,ofp);
               i += 2;
            }
         }
      }
   }
}
