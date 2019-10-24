# x16-sprite
X16 Sprite Demo

**sprite.bas** - Use arrows to move the little puck-shaped man around the screen and eat whatever text is there.

**ghost.bas** - Use arrows to move the monstrous ghost around the screen and haunt everything in its path. Use spacebar to change the color of the ghost.

**load_tiles.bas** - Demo to show game screen with all data in-line BASIC, no binary loads, to be comaptible with WASM emulator. Does not load any sprites due to reaching the upper limits of BASIC program length.

**build_tools.sh** - Builds toolchain to convert plain text hex files (*.txt in this repo) to binaries and in-line BASIC.

**build_basic.sh** - Builds in-line BASIC DATA and VLOAD couplets from all text hex files in repo.

**build_bins.sh** - Builds VLOAD-able binaries from all text hex files in repo. Required before running **load_tiles_sprites**.

**load_tiles_sprites** - Demo to show game screen using binaries directely loaded to VRAM for sprites and tiles. Places player sprite at starting location.

As seen on YouTube:

https://youtu.be/inQlBW3QCRQ  -- first version of sprite.bas, checkout initial commit to re-create

https://youtu.be/PpCiK61k3OA  -- sprite.bas

https://youtu.be/neKg_cboFSw  -- ghost.bas

