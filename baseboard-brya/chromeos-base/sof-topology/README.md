This file should always contain information regarding which branch/commit
the firmware was built from.

CAVS2.5 001 drop stable release.

repo      : https://chrome-internal.googlesource.com/chromeos/third_party/sound-open-firmware-private/
branch    : cavs2.5-001-drop-stable
commit id : 2c8f88ad48394e06444e93c77faaf8b41a7b3573

and cherry-pick commit(s) in the following PR:
        https://github.com/thesofproject/sof/pull/8706

Once built, copy and rename topology files as the following map:
[DRC/EQ-integrated]
tools/build_tools/topology/sof-adl-cs35l41-drceq.tplg                   renamed to sof-adl-cs35l41.tplg
tools/build_tools/topology/sof-adl-max98357a-rt5682-drceq.tplg          renamed to sof-adl-max98357a-rt5682.tplg
tools/build_tools/topology/sof-adl-max98360a-da7219-drceq.tplg          renamed to sof-adl-max98360a-da7219.tplg
tools/build_tools/topology/sof-adl-max98360a-nau8825-drceq.tplg         renamed to sof-adl-max98360a-nau8825.tplg
tools/build_tools/topology/sof-adl-max98360a-rt5682-drceq.tplg          renamed to sof-adl-max98360a-rt5682.tplg
tools/build_tools/topology/sof-adl-max98390-rt5682-drceq.tplg           renamed to sof-adl-max98390-rt5682.tplg
tools/build_tools/topology/sof-adl-max98390-ssp2-rt5682-ssp0-drceq.tplg renamed to sof-adl-max98390-ssp2-rt5682-ssp0.tplg
tools/build_tools/topology/sof-adl-rt1015-nau8825-drceq.tplg            renamed to sof-adl-rt1015-nau8825.tplg
tools/build_tools/topology/sof-adl-rt1019-nau8825-drceq.tplg            renamed to sof-adl-rt1019-nau8825.tplg
tools/build_tools/topology/sof-adl-rt1019-rt5682-drceq.tplg             renamed to sof-adl-rt1019-rt5682.tplg
tools/build_tools/topology/sof-adl-rt5650-drceq.tplg                    renamed to sof-adl-rt5650.tplg
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
1ed0170860a93673569dfdc59249706e  sof-adl-cs35l41.tplg
933c89ac510a64694888c4a6151ac389  sof-adl-max98357a-rt5682-4ch.tplg
e09343060dfe2f548e72f1e3575be178  sof-adl-max98357a-rt5682.tplg
9573b8a59e8c93bdad0fb9b64efdd002  sof-adl-max98360a-da7219.tplg
0108c5b61c96c269940b53882cc17a5d  sof-adl-max98360a-nau8825.tplg
7010c458983bbd8c8845027caa2a6c74  sof-adl-max98360a-rt5682-2way.tplg
901cc397a7829211104361e0786d070b  sof-adl-max98360a-rt5682-4ch.tplg
10e776f117883a67cec8cdb76f26b8dd  sof-adl-max98360a-rt5682.tplg
2cb2ebb3dbb0f51a69c76e3b88b7e87b  sof-adl-max98373-nau8825.tplg
ce3cca82ea09cffecc295aeb1a0c79d6  sof-adl-max98390-rt5682.tplg
9f8b2fc40474874238b9d4de2b6636e0  sof-adl-max98390-ssp2-rt5682-ssp0.tplg
e2104dd408abe169e11407dafb0b90b4  sof-adl-nau8318-nau8825.tplg
71ef8b18abdbdb5801a51951c3577e22  sof-adl-nau8825.tplg
fb89f1f0d6b5671b62aeb4cba0ec58b8  sof-adl-rt1015-nau8825.tplg
d9b7c8760e715edc856b4d558fc066fe  sof-adl-rt1019-nau8825.tplg
cafcd5dbb4a73a0b5dc365a669a730b6  sof-adl-rt1019-rt5682.tplg
aac137f4c2d2ef39a42026404cf729a3  sof-adl-rt5650.tplg
00a905a50ce6f84f10022978262552e1  sof-adl-rt5682.tplg
db14e0a21e66b94fb61abf233cb77ca6  sof-adl-rt711.tplg
b76933bb1d0d2bd98aa2a54c86448fe5  sof-adl-sdw-max98373-rt5682.tplg
d83981c4b9baf21f3b179127781aa08d  pdm1/sof-adl-max98360a-rt5682-2way.tplg
