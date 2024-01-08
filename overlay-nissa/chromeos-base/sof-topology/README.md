This file should always contain information regarding which
branch/commit the firmware was built from.

CAVS2.5-001 drop stable

repo : https://chrome-internal.googlesource.com/chromeos/third_party/sound-open-firmware-private
branch : cavs2.5-001-drop-stable
commit id : 2c8f88ad48394e06444e93c77faaf8b41a7b3573

And cherry-pick commit(s) in the following PR:
        https://github.com/thesofproject/sof/pull/8706

Once built, copy and rename topology files as the following map:
[DRC/EQ-integrated]
tools/build_tools/topology/sof-adl-max98360a-da7219-drceq.tplg  renamed to sof-adl-max98360a-da7219.tplg
tools/build_tools/topology/sof-adl-max98360a-nau8825-drceq.tplg renamed to sof-adl-max98360a-nau8825.tplg
tools/build_tools/topology/sof-adl-max98360a-rt5682-drceq.tplg  renamed to sof-adl-max98360a-rt5682.tplg
tools/build_tools/topology/sof-adl-rt1019-rt5682-drceq.tplg     renamed to sof-adl-rt1019-rt5682.tplg
tools/build_tools/topology/sof-adl-rt5650-drceq.tplg            renamed to sof-adl-rt5650.tplg

MD5SUMs
9573b8a59e8c93bdad0fb9b64efdd002  sof-adl-max98360a-da7219.tplg
0108c5b61c96c269940b53882cc17a5d  sof-adl-max98360a-nau8825.tplg
10e776f117883a67cec8cdb76f26b8dd  sof-adl-max98360a-rt5682.tplg
cafcd5dbb4a73a0b5dc365a669a730b6  sof-adl-rt1019-rt5682.tplg
aac137f4c2d2ef39a42026404cf729a3  sof-adl-rt5650.tplg
