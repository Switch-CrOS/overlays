This file should always contain information regarding which branch/commit
the firmware was built from.

CAVS2.5 001 drop stable release, with dynamic pipeline removed.

repo      : https://chrome-internal.googlesource.com/chromeos/third_party/sound-open-firmware-private/
branch    : cavs2.5-001-drop-stable
commit id : 9a87832712956e9e32f9f94da3ad52bb0212b681

Once built, copy and rename topology files as the following map:
[previous DRC/EQ-integrated candidates]
tools/build_tools/topology/sof-adl-cs35l41.tplg                   renamed to sof-adl-cs35l41.tplg
tools/build_tools/topology/sof-adl-max98357a-rt5682.tplg          renamed to sof-adl-max98357a-rt5682.tplg
tools/build_tools/topology/sof-adl-max98360a-da7219.tplg          renamed to sof-adl-max98360a-da7219.tplg
tools/build_tools/topology/sof-adl-max98360a-nau8825.tplg         renamed to sof-adl-max98360a-nau8825.tplg
tools/build_tools/topology/sof-adl-max98360a-rt5682.tplg          renamed to sof-adl-max98360a-rt5682.tplg
tools/build_tools/topology/sof-adl-max98390-rt5682.tplg           renamed to sof-adl-max98390-rt5682.tplg
tools/build_tools/topology/sof-adl-max98390-ssp2-rt5682-ssp0.tplg renamed to sof-adl-max98390-ssp2-rt5682-ssp0.tplg
tools/build_tools/topology/sof-adl-rt1015-nau8825.tplg            renamed to sof-adl-rt1015-nau8825.tplg
tools/build_tools/topology/sof-adl-rt1019-nau8825.tplg            renamed to sof-adl-rt1019-nau8825.tplg
tools/build_tools/topology/sof-adl-rt1019-rt5682.tplg             renamed to sof-adl-rt1019-rt5682.tplg
tools/build_tools/topology/sof-adl-rt5650.tplg                    renamed to sof-adl-rt5650.tplg
[PDM1]
tools/build_tools/topology/sof-adl-max98360a-rt5682-2way-pdm1.tplg      renamed to pdm1/sof-adl-max98360a-rt5682-2way.tplg

Copy the following topology files:
tools/build_tools/topology/sof-adl-max98357a-rt5682-4ch.tplg
tools/build_tools/topology/sof-adl-max98360a-rt5682-2way.tplg
tools/build_tools/topology/sof-adl-max98360a-rt5682-4ch.tplg
tools/build_tools/topology/sof-adl-max98373-nau8825.tplg
tools/build_tools/topology/sof-adl-nau8318-nau8825.tplg
tools/build_tools/topology/sof-adl-nau8825.tplg
tools/build_tools/topology/sof-adl-rt5682.tplg
tools/build_tools/topology/sof-adl-rt711.tplg
tools/build_tools/topology/sof-adl-sdw-max98373-rt5682.tplg

Md5sum
2c168bea4329f7c81d98b27ffb76580e  sof-adl-cs35l41.tplg
fa6667f1d2815e074c3b3e42d6f31d25  sof-adl-max98357a-rt5682-4ch.tplg
4cc8cbc7fedb0c41c56c47fa2b8ab69b  sof-adl-max98357a-rt5682.tplg
e313e87fc8141bc62d9fb67853546685  sof-adl-max98360a-da7219.tplg
e2104dd408abe169e11407dafb0b90b4  sof-adl-max98360a-nau8825.tplg
ae727de38b8fd9389dc62fd90e0f221d  sof-adl-max98360a-rt5682-2way.tplg
76bf8c5e3061f86e122335e0559300e3  sof-adl-max98360a-rt5682-4ch.tplg
b0e25a02192dd469b5c11ed78ad9e574  sof-adl-max98360a-rt5682.tplg
60049a9ba3bf189daa82be06986f8910  sof-adl-max98373-nau8825.tplg
321a6ce9bb629cd918b6f404d4338680  sof-adl-max98390-rt5682.tplg
eb25b44ded0d425787f7b59ef211ab49  sof-adl-max98390-ssp2-rt5682-ssp0.tplg
e2104dd408abe169e11407dafb0b90b4  sof-adl-nau8318-nau8825.tplg
e822262d5fee4f16d440a9f939b821cf  sof-adl-nau8825.tplg
1753951b1c1b2973e18b076c8ec3ac59  sof-adl-rt1015-nau8825.tplg
6746d268f8500f1cf5121f5fea907578  sof-adl-rt1019-nau8825.tplg
cf9740cdcd569d14ebd64dcc5d105cf9  sof-adl-rt1019-rt5682.tplg
1c3aa0cfa50f8112972cb300f6e15b06  sof-adl-rt5650.tplg
1680e57948f92e60afdacb3882769bc6  sof-adl-rt5682.tplg
db14e0a21e66b94fb61abf233cb77ca6  sof-adl-rt711.tplg
cc758a80048fec38bdc622859d4493a8  sof-adl-sdw-max98373-rt5682.tplg
8959f1d7c734df128b120e2cc223bc3c  pdm1/sof-adl-max98360a-rt5682-2way.tplg
