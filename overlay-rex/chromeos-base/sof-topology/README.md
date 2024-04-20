This file should always contain information regarding which
branch/commit the firmware was built from.

MTL-008 release with audio latency fixes

repo : https://github.com/thesofproject/sof
branch : mtl-008-drop-stable
commid id: 90ca1ae7060dfbd22c376c5dd052b0630cf7f5a4

Copy and rename topology build for this bundle:
${SOF}/tools/build_tools/topology/topology2/production/...
    sof-mtl-max98357a-rt5682.tplg -> sof-mtl-max98360a-rt5682.tplg
    sof-mtl-rt1019-rt5682.tplg -> sof-mtl-rt1019-rt5682.tplg
    sof-mtl-rt5650.tplg -> sof-mtl-rt5650.tplg
    sof-mtl-sdw-cs42l42-l0-max98363-l2.tplg -> sof-mtl-sdw-cs42l42-l0-max98363-l2.tplg
    sof-mtl-max98357a-rt5682-ssp2-ssp0-2ch-pdm1.tplg -> pdm1/sof-mtl-max98360a-rt5682.tplg

MD5sums:
3688af06369ecd91a83d98794599deee  sof-mtl-max98360a-rt5682.tplg
05e6ac4001f73d0ea1422d6444d594c9  sof-mtl-rt1019-rt5682.tplg
c9992c736e2b4ac8b0fd52343dc6235d  sof-mtl-rt5650.tplg
8f79992f6a27cc8321278dbc9a083157  sof-mtl-sdw-cs42l42-l0-max98363-l2.tplg
76b501155adf7af5322e76ce5aa8ecf1  pdm1/sof-mtl-max98360a-rt5682.tplg
