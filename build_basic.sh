#!/bin/bash

./asc2bas.exe tilemap.txt tilemap.bas 					04000 2000
./asc2bas.exe sprite_buffer.txt sprite_buffer.bas 	0E000 3000
./asc2bas.exe tile_buffer.txt tile_buffer.bas		10000 4000
./asc2bas.exe palette.txt palette.bas					F1000 7000
./asc2bas.exe sprite_attr.txt sprite_attr.bas		F5000 8000
