{
    "patcher": {
        "fileversion": 1,
        "appversion": {
            "major": 9,
            "minor": 1,
            "revision": 4,
            "architecture": "x64",
            "modernui": 1
        },
        "classnamespace": "box",
        "rect": [ 0.0, 53.0, 2176.0, 1387.0 ],
        "bglocked": 1,
        "openinpresentation": 1,
        "toolbarvisible": 0,
        "lefttoolbarpinned": 2,
        "toptoolbarpinned": 2,
        "righttoolbarpinned": 2,
        "bottomtoolbarpinned": 2,
        "toolbars_unpinned_last_save": 15,
        "enabletransparentbgwithtitlebar": 1,
        "title": "sousavfx",
        "boxes": [
            {
                "box": {
                    "id": "obj-76",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1274.0, 256.0, 77.0, 22.0 ],
                    "text": "loadmess 66"
                }
            },
            {
                "box": {
                    "bgcolor": [ 1.0, 1.0, 1.0, 0.8 ],
                    "fontname": "Ableton Sans Medium",
                    "id": "obj-75",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1331.0, 291.0, 90.0, 35.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 310.5, 555.0, 93.5, 21.0 ],
                    "text": "maxBrightness:",
                    "textcolor": [ 0.0, 0.0, 0.0, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 1.0, 1.0, 1.0, 0.8 ],
                    "id": "obj-70",
                    "maxclass": "number",
                    "maximum": 100,
                    "minimum": 0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1274.0, 290.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 407.5, 555.0, 50.0, 22.0 ],
                    "textcolor": [ 0.0, 0.0, 0.0, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-53",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1274.0, 322.0, 143.0, 22.0 ],
                    "text": "s sousavfx_rnbo_params"
                }
            },
            {
                "box": {
                    "id": "obj-77",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 613.0, 222.0, 33.0, 22.0 ],
                    "text": "+~ 1"
                }
            },
            {
                "box": {
                    "id": "obj-72",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 613.0, 184.0, 40.0, 22.0 ],
                    "text": "==~ 0"
                }
            },
            {
                "box": {
                    "id": "obj-69",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 613.0, 148.0, 35.0, 22.0 ],
                    "text": "abs~"
                }
            },
            {
                "box": {
                    "id": "obj-67",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 613.0, 255.0, 78.0, 22.0 ],
                    "text": "selector~ 2 1"
                }
            },
            {
                "box": {
                    "id": "obj-51",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 672.0, 148.0, 79.0, 22.0 ],
                    "text": "phasor~ 0.25"
                }
            },
            {
                "box": {
                    "id": "obj-504",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 613.0, 116.0, 42.0, 22.0 ],
                    "text": "delta~"
                }
            },
            {
                "box": {
                    "id": "obj-116",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1920.0, 542.0, 208.0, 47.0 ],
                    "text": "0, angle                      (seam)\n1, index from center   (seamless)\n2, coord                      (low divs only)"
                }
            },
            {
                "box": {
                    "args": [ "mask type" ],
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-114",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "vfx_param_display.maxpat",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "" ],
                    "patching_rect": [ 1767.0, 551.0, 151.0, 29.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 242.0, 458.0, 151.0, 29.0 ],
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "id": "obj-113",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 1053.3846153846155, 1184.0, 55.0, 22.0 ],
                    "text": "zl.slice 1"
                }
            },
            {
                "box": {
                    "id": "obj-109",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 852.0, 989.0, 39.0, 22.0 ],
                    "text": "metro"
                }
            },
            {
                "box": {
                    "id": "obj-29",
                    "maxclass": "ezdac~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 44.0, 93.0, 45.0, 45.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-20",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 110.0, 501.0, 76.0, 22.0 ],
                    "text": "route wclose"
                }
            },
            {
                "box": {
                    "id": "obj-64",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "bang" ],
                    "patching_rect": [ 44.0, 329.0, 49.0, 22.0 ],
                    "text": "b 2"
                }
            },
            {
                "box": {
                    "id": "obj-62",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 44.0, 549.0, 54.0, 22.0 ],
                    "text": "deferlow"
                }
            },
            {
                "box": {
                    "id": "obj-24",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 44.0, 596.0, 109.0, 22.0 ],
                    "text": "s SousaVFX_open"
                }
            },
            {
                "box": {
                    "id": "obj-2",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 74.0, 398.0, 55.0, 22.0 ],
                    "text": "zl.slice 2"
                }
            },
            {
                "box": {
                    "id": "obj-83",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 44.0, 291.0, 54.0, 22.0 ],
                    "text": "deferlow"
                }
            },
            {
                "box": {
                    "id": "obj-4",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 44.0, 257.0, 58.0, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "obj-262",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 74.0, 366.0, 139.0, 22.0 ],
                    "text": "getattr presentation_rect"
                }
            },
            {
                "box": {
                    "id": "obj-203",
                    "maxclass": "newobj",
                    "numinlets": 4,
                    "numoutlets": 0,
                    "patching_rect": [ 233.0, 389.0, 50.5, 22.0 ],
                    "text": "bgcolor"
                }
            },
            {
                "box": {
                    "id": "obj-202",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 233.0, 357.0, 78.0, 22.0 ],
                    "text": "r bgcolor_set"
                }
            },
            {
                "box": {
                    "id": "obj-81",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 233.0, 429.0, 63.0, 22.0 ],
                    "text": "closebang"
                }
            },
            {
                "box": {
                    "id": "obj-86",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "patching_rect": [ 110.0, 471.0, 265.0, 22.0 ],
                    "text": "\"floating window positioner\" SousaVFX 0 nofloat"
                }
            },
            {
                "box": {
                    "fontsize": 8.935726999796946,
                    "id": "obj-87",
                    "linecount": 5,
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 11.0, 16.0, 96.0, 58.0 ],
                    "text": "window flags nofloat, window flags zoom, window flags grow, window exec, savewindow 0"
                }
            },
            {
                "box": {
                    "id": "obj-65",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 167.0, 549.0, 67.0, 22.0 ],
                    "save": [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
                    "text": "thispatcher"
                }
            },
            {
                "box": {
                    "id": "obj-61",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 893.0, 910.0, 143.0, 22.0 ],
                    "text": "s sousavfx_rnbo_params"
                }
            },
            {
                "box": {
                    "id": "obj-57",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 457.0, 364.0, 141.0, 22.0 ],
                    "text": "r sousavfx_rnbo_params"
                }
            },
            {
                "box": {
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-74",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "sousaVFX-rnbopat.maxpat",
                    "numinlets": 7,
                    "numoutlets": 2,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "", "list" ],
                    "patching_rect": [ 613.0, 427.0, 543.0, 33.0 ],
                    "varname": "sousaVFX-switcher",
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "fontsize": 17.854971115840677,
                    "id": "obj-131",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 338.0, 192.0, 48.0, 28.0 ],
                    "text": "open"
                }
            },
            {
                "box": {
                    "id": "obj-49",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 338.0, 236.0, 143.0, 22.0 ],
                    "text": "s sousavfx_rnbo_params"
                }
            },
            {
                "box": {
                    "id": "obj-478",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 212.0, 272.0, 143.0, 22.0 ],
                    "text": "s sousavfx_rnbo_params"
                }
            },
            {
                "box": {
                    "id": "obj-462",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 212.0, 187.0, 38.0, 38.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-259",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 212.0, 236.0, 105.0, 22.0 ],
                    "text": "prepend autobuild"
                }
            },
            {
                "box": {
                    "id": "obj-454",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 162.0, 27.0, 29.5, 22.0 ],
                    "text": "0"
                }
            },
            {
                "box": {
                    "id": "obj-437",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 251.0, 28.0, 141.0, 20.0 ],
                    "text": "external / rnbopat switch"
                }
            },
            {
                "box": {
                    "id": "obj-399",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 114.0, 187.0, 71.0, 22.0 ],
                    "text": "fromsymbol"
                }
            },
            {
                "box": {
                    "id": "obj-393",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 215.0, 22.0, 31.0, 31.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-390",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 114.0, 226.0, 67.0, 22.0 ],
                    "save": [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
                    "text": "thispatcher"
                }
            },
            {
                "box": {
                    "id": "obj-358",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "" ],
                    "patching_rect": [ 215.0, 109.0, 31.0, 22.0 ],
                    "text": "t b s"
                }
            },
            {
                "box": {
                    "id": "obj-357",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 215.0, 69.0, 152.0, 22.0 ],
                    "text": "list.lookup external rnbopat"
                }
            },
            {
                "box": {
                    "id": "obj-254",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 114.0, 148.0, 411.0, 22.0 ],
                    "text": "combine \"script sendbox sousaVFX-switcher replace sousaVFX-\" s .maxpat"
                }
            },
            {
                "box": {
                    "id": "obj-60",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 693.0, 532.0, 29.5, 22.0 ],
                    "text": "+ 1"
                }
            },
            {
                "box": {
                    "id": "obj-59",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 565.0, 532.0, 29.5, 22.0 ],
                    "text": "+ 1"
                }
            },
            {
                "box": {
                    "allowdrag": 0,
                    "arrow": 0,
                    "bgcolor": [ 1.0, 1.0, 1.0, 0.8 ],
                    "bgfillcolor_angle": 270.0,
                    "bgfillcolor_autogradient": 0.0,
                    "bgfillcolor_color": [ 1.0, 1.0, 1.0, 0.8 ],
                    "bgfillcolor_color1": [ 1.0, 1.0, 1.0, 1.0 ],
                    "bgfillcolor_color2": [ 0.172137149796092, 0.172137100044002, 0.172137113045018, 1.0 ],
                    "bgfillcolor_proportion": 0.5,
                    "bgfillcolor_type": "color",
                    "id": "obj-58",
                    "ignoreclick": 1,
                    "items": [ "1:", "drum", ",", "2:", "bass", ",", "3:", "solo" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 693.0, 563.0, 100.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 174.0, 76.0, 68.0, 22.0 ],
                    "textcolor": [ 0.0, 0.0, 0.0, 1.0 ]
                }
            },
            {
                "box": {
                    "allowdrag": 0,
                    "arrow": 0,
                    "bgcolor": [ 1.0, 1.0, 1.0, 0.8 ],
                    "bgfillcolor_angle": 270.0,
                    "bgfillcolor_autogradient": 0.0,
                    "bgfillcolor_color": [ 1.0, 1.0, 1.0, 0.8 ],
                    "bgfillcolor_color1": [ 1.0, 1.0, 1.0, 1.0 ],
                    "bgfillcolor_color2": [ 0.172137149796092, 0.172137100044002, 0.172137113045018, 1.0 ],
                    "bgfillcolor_proportion": 0.5,
                    "bgfillcolor_type": "color",
                    "id": "obj-52",
                    "ignoreclick": 1,
                    "items": [ 1.0, "radius", "cutoff", ",", 2.0, "width", ",", 3.0, "curve", ",", 4.0, "brightness", ",", 5.0, "rotation" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 565.0, 563.0, 112.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 130.0, 104.0, 112.0, 22.0 ],
                    "textcolor": [ 0.0, 0.0, 0.0, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-50",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 678.0, 479.0, 73.0, 33.0 ],
                    "text": "1. vfx num\n2. inst num"
                }
            },
            {
                "box": {
                    "id": "obj-48",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 613.0, 484.0, 56.0, 22.0 ],
                    "text": "route 1 2"
                }
            },
            {
                "box": {
                    "id": "obj-47",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 997.0, 760.5, 37.0, 22.0 ],
                    "text": "* 253"
                }
            },
            {
                "box": {
                    "id": "obj-105",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "bang", "int", "int", "int" ],
                    "patching_rect": [ 976.0, 711.0, 50.5, 22.0 ],
                    "text": "t b i i i"
                }
            },
            {
                "box": {
                    "activebgcolor": [ 1.0, 1.0, 1.0, 0.8 ],
                    "activelinecolor": [ 0.0, 0.0, 0.0, 1.0 ],
                    "id": "obj-104",
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 1007.0, 361.0, 81.0, 28.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 20.0, 325.0, 84.0, 28.0 ],
                    "range": [ -0.1, 1.1 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.07843137254902, 0.07843137254902, 0.07843137254902, 1.0 ],
                    "color": [ 0.10196078431372549, 0.5098039215686274, 0.796078431372549, 1.0 ],
                    "id": "obj-103",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 1023.0, 329.0, 76.0, 22.0 ],
                    "text": "r~ drum_env",
                    "textcolor": [ 0.647058823529412, 1.0, 0.725490196078431, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-46",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1104.0, 484.5, 52.0, 22.0 ],
                    "text": "gate 1 0"
                }
            },
            {
                "box": {
                    "id": "obj-6",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "int", "float", "int", "int" ],
                    "patching_rect": [ 1006.0, 565.0, 62.0, 22.0 ],
                    "text": "dspstate~"
                }
            },
            {
                "box": {
                    "id": "obj-12",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 976.0, 601.0, 49.0, 22.0 ],
                    "text": "pak 0 0"
                }
            },
            {
                "box": {
                    "id": "obj-21",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 976.0, 638.0, 49.0, 22.0 ],
                    "text": "||"
                }
            },
            {
                "box": {
                    "id": "obj-22",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 976.0, 528.0, 58.0, 22.0 ],
                    "text": "route set"
                }
            },
            {
                "box": {
                    "id": "obj-63",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "int" ],
                    "patching_rect": [ 976.0, 492.0, 92.0, 22.0 ],
                    "text": "adstatus switch"
                }
            },
            {
                "box": {
                    "args": [ "division fraction" ],
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-66",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "vfx_param_display.maxpat",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "" ],
                    "patching_rect": [ 1308.0, 925.0, 151.0, 29.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 111.0, 368.0, 151.0, 29.0 ],
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "id": "obj-152",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1137.0, 364.0, 73.0, 22.0 ],
                    "text": "r FX-to-VFX"
                }
            },
            {
                "box": {
                    "activebgcolor": [ 1.0, 1.0, 1.0, 0.8 ],
                    "activelinecolor": [ 0.0, 0.0, 0.0, 1.0 ],
                    "id": "obj-30",
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 930.0, 326.0, 81.0, 28.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 20.0, 287.0, 84.0, 28.0 ],
                    "range": [ -0.1, 1.1 ]
                }
            },
            {
                "box": {
                    "activebgcolor": [ 1.0, 1.0, 1.0, 0.8 ],
                    "activelinecolor": [ 0.0, 0.0, 0.0, 1.0 ],
                    "id": "obj-28",
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 852.0, 291.0, 81.0, 28.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 20.0, 213.0, 84.0, 28.0 ],
                    "range": [ -0.1, 1.1 ]
                }
            },
            {
                "box": {
                    "activebgcolor": [ 1.0, 1.0, 1.0, 0.8 ],
                    "activelinecolor": [ 0.0, 0.0, 0.0, 1.0 ],
                    "id": "obj-27",
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 776.0, 255.0, 81.0, 28.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 20.0, 176.0, 84.0, 28.0 ],
                    "range": [ -0.1, 1.1 ]
                }
            },
            {
                "box": {
                    "activebgcolor": [ 1.0, 1.0, 1.0, 0.8 ],
                    "activelinecolor": [ 0.0, 0.0, 0.0, 1.0 ],
                    "id": "obj-26",
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 698.0, 220.0, 81.0, 28.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 20.0, 138.0, 84.0, 28.0 ],
                    "range": [ -0.1, 1.1 ]
                }
            },
            {
                "box": {
                    "activebgcolor": [ 1.0, 1.0, 1.0, 0.8 ],
                    "activelinecolor": [ 0.0, 0.0, 0.0, 1.0 ],
                    "id": "obj-25",
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 671.0, 113.0, 81.0, 28.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 20.0, 101.0, 84.0, 28.0 ],
                    "range": [ -0.1, 1.1 ]
                }
            },
            {
                "box": {
                    "args": [ "gradient offset" ],
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-19",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "vfx_param_display.maxpat",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "" ],
                    "patching_rect": [ 1716.0, 590.0, 151.0, 29.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 307.0, 11.0, 151.0, 29.0 ],
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "args": [ "pattern" ],
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-18",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "vfx_param_display.maxpat",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "" ],
                    "patching_rect": [ 1665.0, 632.0, 151.0, 29.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 283.0, 56.0, 151.0, 29.0 ],
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "args": [ "peak position" ],
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-17",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "vfx_param_display.maxpat",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "" ],
                    "patching_rect": [ 1614.0, 674.0, 151.0, 29.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 258.0, 100.0, 151.0, 29.0 ],
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "args": [ "fade out" ],
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-16",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "vfx_param_display.maxpat",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "" ],
                    "patching_rect": [ 1563.0, 716.0, 151.0, 29.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 234.0, 145.0, 151.0, 29.0 ],
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "args": [ "fade in" ],
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-15",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "vfx_param_display.maxpat",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "" ],
                    "patching_rect": [ 1512.0, 757.0, 151.0, 29.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 209.0, 190.0, 151.0, 29.0 ],
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "args": [ "rotation" ],
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-14",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "vfx_param_display.maxpat",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "" ],
                    "patching_rect": [ 1461.0, 799.0, 151.0, 29.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 184.0, 234.0, 151.0, 29.0 ],
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "args": [ "curve amount" ],
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-13",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "vfx_param_display.maxpat",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "" ],
                    "patching_rect": [ 1410.0, 841.0, 151.0, 29.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 159.0, 279.0, 151.0, 29.0 ],
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "args": [ "division width" ],
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-10",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "vfx_param_display.maxpat",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "" ],
                    "patching_rect": [ 1359.0, 883.0, 151.0, 29.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 135.0, 324.0, 151.0, 29.0 ],
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "args": [ "division number" ],
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-9",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "vfx_param_display.maxpat",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "" ],
                    "patching_rect": [ 1257.0, 967.0, 151.0, 29.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 84.0, 413.0, 151.0, 29.0 ],
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "args": [ "palette" ],
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-7",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "vfx_param_display.maxpat",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "" ],
                    "patching_rect": [ 1206.0, 1008.0, 151.0, 29.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 61.0, 458.0, 151.0, 29.0 ],
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "args": [ "radius cutoff" ],
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-3",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "vfx_param_display.maxpat",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "" ],
                    "patching_rect": [ 1155.0, 1050.0, 151.0, 29.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 36.0, 502.0, 151.0, 29.0 ],
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "args": [ "brightness" ],
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-23",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "vfx_param_display.maxpat",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "int" ],
                    "patching_rect": [ 1104.0, 1092.0, 151.0, 29.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 12.0, 547.0, 151.0, 29.0 ],
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "bgcolor": [ 1.0, 1.0, 1.0, 0.8 ],
                    "fontface": 0,
                    "fontname": "Ableton Sans Medium",
                    "id": "obj-1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 930.0, 837.0, 43.0, 21.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 223.0, 33.5, 32.0, 21.0 ],
                    "text": "FPS",
                    "textcolor": [ 0.0, 0.0, 0.0, 1.0 ]
                }
            },
            {
                "box": {
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "embed": 1,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-118",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "" ],
                    "patcher": {
                        "fileversion": 1,
                        "appversion": {
                            "major": 9,
                            "minor": 1,
                            "revision": 4,
                            "architecture": "x64",
                            "modernui": 1
                        },
                        "classnamespace": "box",
                        "rect": [ 1212.0, 328.0, 1000.0, 780.0 ],
                        "openinpresentation": 1,
                        "boxes": [
                            {
                                "box": {
                                    "id": "obj-9",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "bang" ],
                                    "patching_rect": [ 50.0, 138.0, 29.5, 22.0 ],
                                    "text": "b 2"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-7",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 0,
                                    "patching_rect": [ 152.0, 209.0, 55.0, 22.0 ],
                                    "text": "dac~ 1 2"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-3",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 165.0, 175.0, 39.0, 22.0 ],
                                    "text": "click~"
                                }
                            },
                            {
                                "box": {
                                    "bgcolor": [ 0.917647058823529, 1.0, 1.0, 1.0 ],
                                    "fontname": "Ableton Sans Medium",
                                    "id": "obj-234",
                                    "linecount": 3,
                                    "maxclass": "comment",
                                    "numinlets": 0,
                                    "numoutlets": 0,
                                    "patching_rect": [ 90.0, 90.0, 96.0, 50.0 ],
                                    "presentation": 1,
                                    "presentation_linecount": 2,
                                    "presentation_rect": [ 45.0, 5.0, 126.0, 35.0 ],
                                    "suppressinlet": 1,
                                    "text": "flashbang for setting OBS render delay",
                                    "textcolor": [ 0.2, 0.192156862745098, 0.192156862745098, 1.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-856",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 90.0, 209.0, 41.0, 22.0 ],
                                    "text": "del 66"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-797",
                                    "maxclass": "button",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 50.0, 91.0, 35.0, 35.0 ],
                                    "presentation": 1,
                                    "presentation_rect": [ 5.0, 5.0, 35.0, 35.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-202",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 50.0, 209.0, 29.0, 22.0 ],
                                    "text": "t 50"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-716",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 3,
                                    "outlettype": [ "bang", "bang", "int" ],
                                    "patching_rect": [ 50.0, 175.0, 47.0, 22.0 ],
                                    "text": "uzi 624"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-507",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 90.0, 269.0, 22.0, 22.0 ],
                                    "text": "t 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-14",
                                    "linecount": 3,
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 50.0, 301.0, 78.0, 49.0 ],
                                    "text": "zl group 624 @zlmaxsize 624"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-75",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 3,
                                    "outlettype": [ "bang", "bang", "int" ],
                                    "patching_rect": [ 90.0, 239.0, 47.0, 22.0 ],
                                    "text": "uzi 624"
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-117",
                                    "index": 1,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 50.0, 410.0, 30.0, 30.0 ]
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-117", 0 ],
                                    "source": [ "obj-14", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-14", 0 ],
                                    "source": [ "obj-202", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-7", 1 ],
                                    "order": 0,
                                    "source": [ "obj-3", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-7", 0 ],
                                    "order": 1,
                                    "source": [ "obj-3", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-14", 0 ],
                                    "source": [ "obj-507", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-202", 0 ],
                                    "source": [ "obj-716", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-856", 0 ],
                                    "source": [ "obj-716", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-507", 0 ],
                                    "source": [ "obj-75", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-9", 0 ],
                                    "source": [ "obj-797", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-75", 0 ],
                                    "source": [ "obj-856", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-3", 0 ],
                                    "source": [ "obj-9", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-716", 0 ],
                                    "source": [ "obj-9", 0 ]
                                }
                            }
                        ],
                        "toolbaradditions": [ "packagemanager" ],
                        "toolbarexclusions": [ "mixerslider", "quickrecord", "showsnapshots", "showmappings" ]
                    },
                    "patching_rect": [ 1111.3846153846155, 1220.0, 178.0, 46.0 ],
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "id": "obj-119",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 872.0, 945.0, 48.0, 22.0 ],
                    "text": "!/ 1000"
                }
            },
            {
                "box": {
                    "id": "obj-111",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 872.0, 798.0, 83.0, 22.0 ],
                    "text": "loadmess 260"
                }
            },
            {
                "box": {
                    "bgcolor": [ 1.0, 1.0, 1.0, 0.8 ],
                    "fontname": "Ableton Sans Medium",
                    "id": "obj-110",
                    "maxclass": "number",
                    "maximum": 360,
                    "minimum": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 872.0, 836.0, 52.0, 23.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 174.0, 32.5, 44.0, 23.0 ],
                    "textcolor": [ 0.0, 0.0, 0.0, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-108",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 893.0, 874.0, 152.0, 22.0 ],
                    "text": "prepend framesPerSecond"
                }
            },
            {
                "box": {
                    "id": "obj-71",
                    "maxclass": "newobj",
                    "numinlets": 15,
                    "numoutlets": 15,
                    "outlettype": [ "", "", "", "", "", "", "", "", "", "", "", "", "", "", "" ],
                    "patching_rect": [ 1104.0, 516.5, 733.0, 22.0 ],
                    "text": "route brightness radius palette divisionsHi divisionsLo width curve rotation fadeIn fadeOut peakPosition pattern gradientOffset maskType"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.07843137254902, 0.07843137254902, 0.07843137254902, 1.0 ],
                    "color": [ 0.10196078431372549, 0.5098039215686274, 0.796078431372549, 1.0 ],
                    "id": "obj-54",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 869.0, 258.0, 180.0, 22.0 ],
                    "text": "r~ High_Freq_Mod_w_tuba_env",
                    "textcolor": [ 0.647058823529412, 1.0, 0.725490196078431, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.07843137254902, 0.07843137254902, 0.07843137254902, 1.0 ],
                    "color": [ 0.10196078431372549, 0.5098039215686274, 0.796078431372549, 1.0 ],
                    "id": "obj-426",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 643.0, 74.0, 92.0, 22.0 ],
                    "text": "r~ main_phasor",
                    "textcolor": [ 0.647058823529412, 1.0, 0.725490196078431, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.07843137254902, 0.07843137254902, 0.07843137254902, 1.0 ],
                    "color": [ 0.10196078431372549, 0.5098039215686274, 0.796078431372549, 1.0 ],
                    "id": "obj-1077",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 794.0, 223.0, 205.0, 22.0 ],
                    "text": "r~ Dry-Wet_Mix_no_transient_helper",
                    "textcolor": [ 0.647058823529412, 1.0, 0.725490196078431, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.07843137254902, 0.07843137254902, 0.07843137254902, 1.0 ],
                    "color": [ 0.10196078431372549, 0.5098039215686274, 0.796078431372549, 1.0 ],
                    "id": "obj-55",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 719.0, 187.0, 275.0, 22.0 ],
                    "text": "r~ Phasor_with_phase_offset_and_rate_multiplier",
                    "textcolor": [ 0.647058823529412, 1.0, 0.725490196078431, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.07843137254902, 0.07843137254902, 0.07843137254902, 1.0 ],
                    "color": [ 0.10196078431372549, 0.5098039215686274, 0.796078431372549, 1.0 ],
                    "id": "obj-56",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 947.0, 294.0, 127.0, 22.0 ],
                    "text": "r~ tuba_env_w_delrev",
                    "textcolor": [ 0.647058823529412, 1.0, 0.725490196078431, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-346",
                    "maxclass": "newobj",
                    "numinlets": 15,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1053.3846153846155, 1148.0, 727.6153846153845, 22.0 ],
                    "text": "pack i i i i i i i i i i i i i i i"
                }
            },
            {
                "box": {
                    "fontname": "Ableton Sans Light",
                    "id": "obj-309",
                    "maxclass": "comment",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "patching_rect": [ 1015.3846153846155, 1325.0, 69.0, 21.0 ],
                    "suppressinlet": 1,
                    "text": "end marker"
                }
            },
            {
                "box": {
                    "fontname": "Ableton Sans Light",
                    "id": "obj-314",
                    "maxclass": "comment",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "patching_rect": [ 1013.3846153846155, 1285.0, 73.0, 21.0 ],
                    "suppressinlet": 1,
                    "text": "start marker"
                }
            },
            {
                "box": {
                    "id": "obj-316",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1089.3846153846155, 1324.0, 72.0, 22.0 ],
                    "text": "append 255"
                }
            },
            {
                "box": {
                    "id": "obj-345",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1089.3846153846155, 1284.0, 76.0, 22.0 ],
                    "text": "prepend 254"
                }
            },
            {
                "box": {
                    "id": "obj-5",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 1263.0, 1774.0, 118.0, 22.0 ],
                    "text": "route debug-console"
                }
            },
            {
                "box": {
                    "id": "obj-11",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1393.0, 1517.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-31",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1370.0, 2010.0, 32.0, 22.0 ],
                    "text": "print"
                }
            },
            {
                "box": {
                    "id": "obj-32",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 1370.0, 1980.0, 91.0, 22.0 ],
                    "text": "routepass baud"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-33",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1285.0, 2042.0, 98.0, 22.0 ],
                    "text": "prepend append"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-34",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 1285.0, 2010.0, 49.0, 22.0 ],
                    "text": "zl iter 1"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-35",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 1285.0, 1980.0, 62.0, 22.0 ],
                    "text": "route port"
                }
            },
            {
                "box": {
                    "id": "obj-36",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 1139.0, 1409.0, 48.0, 22.0 ],
                    "text": "del 100"
                }
            },
            {
                "box": {
                    "id": "obj-37",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "bang", "bang", "bang", "bang" ],
                    "patching_rect": [ 1139.0, 1482.0, 199.0, 22.0 ],
                    "text": "b 4"
                }
            },
            {
                "box": {
                    "activebgcolor": [ 0.3137254901960784, 0.19215686274509805, 0.19215686274509805, 0.8 ],
                    "activetextcolor": [ 0.85, 0.85, 0.85, 1.0 ],
                    "automation": "1",
                    "automationon": "2",
                    "fontsize": 12.0,
                    "id": "obj-112",
                    "maxclass": "live.text",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1139.0, 1440.0, 199.0, 32.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 6.0, 4.0, 146.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "activebgcolor": {
                            "expression": ""
                        },
                        "activetextcolor": {
                            "expression": ""
                        },
                        "valueof": {
                            "parameter_enum": [ "1", "2" ],
                            "parameter_longname": "live.text[10]",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "live.text",
                            "parameter_type": 2
                        }
                    },
                    "text": "Connect to Teensy",
                    "texton": "Acoustic Auto-switch Active",
                    "varname": "live.text[10]"
                }
            },
            {
                "box": {
                    "id": "obj-167",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1259.0, 1604.0, 71.0, 22.0 ],
                    "text": "fromsymbol"
                }
            },
            {
                "box": {
                    "id": "obj-168",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "set usbmodem40590801" ],
                    "patching_rect": [ 1259.0, 1564.0, 156.0, 22.0 ],
                    "text": "t \"set usbmodem40590801\""
                }
            },
            {
                "box": {
                    "id": "obj-324",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 1199.0, 1524.0, 48.0, 22.0 ],
                    "text": "del 200"
                }
            },
            {
                "box": {
                    "id": "obj-323",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 1259.0, 1524.0, 48.0, 22.0 ],
                    "text": "del 100"
                }
            },
            {
                "box": {
                    "id": "obj-135",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 1139.0, 1380.0, 58.0, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "bgcolor": [ 1.0, 1.0, 1.0, 0.8 ],
                    "bgcolor2": [ 1.0, 1.0, 1.0, 0.8 ],
                    "bgfillcolor_angle": 270.0,
                    "bgfillcolor_autogradient": 0.0,
                    "bgfillcolor_color": [ 1.0, 1.0, 1.0, 0.8 ],
                    "bgfillcolor_color1": [ 1.0, 1.0, 1.0, 0.8 ],
                    "bgfillcolor_color2": [ 0.172137149796092, 0.172137100044002, 0.172137113045018, 1.0 ],
                    "bgfillcolor_proportion": 0.5,
                    "bgfillcolor_type": "color",
                    "fontname": "Ableton Sans Medium",
                    "fontsize": 12.0,
                    "gradient": 1,
                    "id": "obj-38",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1459.0, 1851.0, 58.0, 23.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 94.0, 59.0, 58.0, 23.0 ],
                    "text": "getbaud",
                    "textcolor": [ 0.0, 0.0, 0.0, 1.0 ]
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 11.59,
                    "id": "obj-39",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "open", "" ],
                    "patching_rect": [ 1263.0, 1851.0, 49.0, 21.0 ],
                    "text": "t open l"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-40",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1263.0, 1818.0, 87.0, 22.0 ],
                    "text": "sprintf port %s"
                }
            },
            {
                "box": {
                    "allowdrag": 0,
                    "bgcolor": [ 1.0, 1.0, 1.0, 0.8 ],
                    "bgfillcolor_angle": 270.0,
                    "bgfillcolor_autogradient": 0.0,
                    "bgfillcolor_color": [ 1.0, 1.0, 1.0, 0.8 ],
                    "bgfillcolor_color1": [ 0.172137149796092, 0.172137100044002, 0.172137113045018, 1.0 ],
                    "bgfillcolor_color2": [ 0.172137149796092, 0.172137100044002, 0.172137113045018, 1.0 ],
                    "bgfillcolor_proportion": 0.5,
                    "bgfillcolor_type": "color",
                    "fontname": "Ableton Sans Medium",
                    "id": "obj-41",
                    "items": [ "debug-console", ",", "MINIRIG4", ",", "Bluetooth-Incoming-Port" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1200.0, 1737.0, 146.0, 23.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 6.0, 32.0, 146.0, 23.0 ],
                    "textcolor": [ 0.0, 0.0, 0.0, 1.0 ]
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-42",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "print", "clear" ],
                    "patching_rect": [ 1319.0, 1654.0, 68.0, 22.0 ],
                    "text": "t print clear"
                }
            },
            {
                "box": {
                    "bgcolor": [ 1.0, 1.0, 1.0, 0.8 ],
                    "bgcolor2": [ 1.0, 1.0, 1.0, 0.8 ],
                    "bgfillcolor_angle": 270.0,
                    "bgfillcolor_autogradient": 0.0,
                    "bgfillcolor_color": [ 1.0, 1.0, 1.0, 0.8 ],
                    "bgfillcolor_color1": [ 1.0, 1.0, 1.0, 0.8 ],
                    "bgfillcolor_color2": [ 0.172137149796092, 0.172137100044002, 0.172137113045018, 1.0 ],
                    "bgfillcolor_proportion": 0.5,
                    "bgfillcolor_type": "color",
                    "fontname": "Ableton Sans Medium",
                    "gradient": 1,
                    "id": "obj-43",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1417.0, 1851.0, 38.0, 23.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 49.5, 59.0, 38.0, 23.0 ],
                    "text": "close",
                    "textcolor": [ 0.0, 0.0, 0.0, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 1.0, 1.0, 1.0, 0.8 ],
                    "bgcolor2": [ 1.0, 1.0, 1.0, 0.8 ],
                    "bgfillcolor_angle": 270.0,
                    "bgfillcolor_autogradient": 0.0,
                    "bgfillcolor_color": [ 1.0, 1.0, 1.0, 0.8 ],
                    "bgfillcolor_color1": [ 1.0, 1.0, 1.0, 0.8 ],
                    "bgfillcolor_color2": [ 0.172137149796092, 0.172137100044002, 0.172137113045018, 1.0 ],
                    "bgfillcolor_proportion": 0.5,
                    "bgfillcolor_type": "color",
                    "fontname": "Ableton Sans Medium",
                    "gradient": 1,
                    "id": "obj-44",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1373.0, 1851.0, 37.0, 23.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 6.0, 59.0, 37.0, 23.0 ],
                    "text": "open",
                    "textcolor": [ 0.0, 0.0, 0.0, 1.0 ]
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-45",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "int", "" ],
                    "patching_rect": [ 1139.0, 1932.0, 165.0, 22.0 ],
                    "text": "serial c 115200 @autoopen 0"
                }
            },
            {
                "box": {
                    "angle": 270.0,
                    "background": 1,
                    "bgcolor": [ 0.172137149796092, 0.172137100044002, 0.172137113045018, 0.0 ],
                    "bordercolor": [ 0.0, 0.0, 0.0, 1.0 ],
                    "id": "obj-8",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 134.0, 429.0, 36.0, 31.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 0.0, 0.0, 469.0, 588.0 ],
                    "proportion": 0.5
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-346", 6 ],
                    "source": [ "obj-10", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-104", 0 ],
                    "order": 0,
                    "source": [ "obj-103", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-74", 5 ],
                    "order": 1,
                    "source": [ "obj-103", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-109", 0 ],
                    "midpoints": [ 996.0, 749.0, 861.5, 749.0 ],
                    "source": [ "obj-105", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-346", 0 ],
                    "midpoints": [ 985.5, 819.0, 1062.8846153846155, 819.0 ],
                    "source": [ "obj-105", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-46", 0 ],
                    "midpoints": [ 1017.0, 749.0, 1091.0, 749.0, 1091.0, 474.0, 1113.5, 474.0 ],
                    "source": [ "obj-105", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-47", 0 ],
                    "source": [ "obj-105", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-27", 0 ],
                    "order": 0,
                    "source": [ "obj-1077", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-74", 2 ],
                    "order": 1,
                    "source": [ "obj-1077", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-61", 0 ],
                    "source": [ "obj-108", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-346", 0 ],
                    "source": [ "obj-109", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-168", 0 ],
                    "source": [ "obj-11", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-108", 0 ],
                    "order": 0,
                    "source": [ "obj-110", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-119", 0 ],
                    "order": 1,
                    "source": [ "obj-110", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-110", 0 ],
                    "source": [ "obj-111", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-37", 0 ],
                    "source": [ "obj-112", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-345", 0 ],
                    "source": [ "obj-113", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-346", 14 ],
                    "source": [ "obj-114", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-345", 0 ],
                    "source": [ "obj-118", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-109", 1 ],
                    "source": [ "obj-119", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-21", 0 ],
                    "source": [ "obj-12", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-346", 7 ],
                    "source": [ "obj-13", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-49", 0 ],
                    "source": [ "obj-131", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-36", 0 ],
                    "source": [ "obj-135", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-346", 8 ],
                    "source": [ "obj-14", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-346", 9 ],
                    "source": [ "obj-15", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-74", 6 ],
                    "source": [ "obj-152", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-346", 10 ],
                    "source": [ "obj-16", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-41", 0 ],
                    "midpoints": [ 1268.5, 1682.0, 1209.5, 1682.0 ],
                    "source": [ "obj-167", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-167", 0 ],
                    "source": [ "obj-168", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-346", 11 ],
                    "source": [ "obj-17", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-346", 12 ],
                    "source": [ "obj-18", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-346", 13 ],
                    "source": [ "obj-19", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-86", 0 ],
                    "source": [ "obj-2", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-65", 0 ],
                    "source": [ "obj-20", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-203", 0 ],
                    "source": [ "obj-202", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-105", 0 ],
                    "source": [ "obj-21", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-12", 0 ],
                    "source": [ "obj-22", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-346", 1 ],
                    "source": [ "obj-23", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-399", 0 ],
                    "source": [ "obj-254", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-478", 0 ],
                    "source": [ "obj-259", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2", 0 ],
                    "source": [ "obj-262", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-8", 0 ],
                    "source": [ "obj-262", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-346", 2 ],
                    "source": [ "obj-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-45", 0 ],
                    "midpoints": [ 1098.8846153846155, 1585.0, 1148.5, 1585.0 ],
                    "source": [ "obj-316", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-31", 0 ],
                    "source": [ "obj-32", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-168", 0 ],
                    "source": [ "obj-323", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-41", 0 ],
                    "source": [ "obj-324", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-41", 0 ],
                    "midpoints": [ 1294.5, 2110.0, 1542.0, 2110.0, 1542.0, 1721.0, 1209.5, 1721.0 ],
                    "source": [ "obj-33", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-33", 0 ],
                    "source": [ "obj-34", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-316", 0 ],
                    "source": [ "obj-345", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-113", 0 ],
                    "source": [ "obj-346", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-34", 0 ],
                    "source": [ "obj-35", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-358", 0 ],
                    "source": [ "obj-357", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-254", 1 ],
                    "source": [ "obj-358", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-254", 0 ],
                    "source": [ "obj-358", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-112", 0 ],
                    "source": [ "obj-36", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-323", 0 ],
                    "source": [ "obj-37", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-324", 0 ],
                    "source": [ "obj-37", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-42", 0 ],
                    "source": [ "obj-37", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-45", 0 ],
                    "source": [ "obj-38", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-45", 0 ],
                    "source": [ "obj-39", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-45", 0 ],
                    "source": [ "obj-39", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-357", 0 ],
                    "source": [ "obj-393", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-390", 0 ],
                    "source": [ "obj-399", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-83", 0 ],
                    "source": [ "obj-4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-39", 0 ],
                    "source": [ "obj-40", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "source": [ "obj-41", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-41", 0 ],
                    "midpoints": [ 1377.5, 1708.0, 1209.5, 1708.0 ],
                    "source": [ "obj-42", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-45", 0 ],
                    "midpoints": [ 1328.5, 1695.0, 1148.5, 1695.0 ],
                    "source": [ "obj-42", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-25", 0 ],
                    "order": 0,
                    "source": [ "obj-426", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-504", 0 ],
                    "order": 2,
                    "source": [ "obj-426", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-67", 1 ],
                    "order": 1,
                    "source": [ "obj-426", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-45", 0 ],
                    "source": [ "obj-43", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-45", 0 ],
                    "source": [ "obj-44", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-32", 0 ],
                    "order": 0,
                    "source": [ "obj-45", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-35", 0 ],
                    "order": 1,
                    "source": [ "obj-45", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-357", 0 ],
                    "source": [ "obj-454", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-71", 0 ],
                    "source": [ "obj-46", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-259", 0 ],
                    "source": [ "obj-462", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-23", 0 ],
                    "midpoints": [ 1006.5, 799.0, 1113.5, 799.0 ],
                    "source": [ "obj-47", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-59", 0 ],
                    "source": [ "obj-48", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-60", 0 ],
                    "source": [ "obj-48", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-40", 0 ],
                    "source": [ "obj-5", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-69", 0 ],
                    "source": [ "obj-504", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-67", 2 ],
                    "source": [ "obj-51", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-28", 0 ],
                    "order": 0,
                    "source": [ "obj-54", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-74", 3 ],
                    "order": 1,
                    "source": [ "obj-54", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-26", 0 ],
                    "order": 0,
                    "source": [ "obj-55", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-74", 1 ],
                    "order": 1,
                    "source": [ "obj-55", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-30", 0 ],
                    "order": 0,
                    "source": [ "obj-56", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-74", 4 ],
                    "order": 1,
                    "source": [ "obj-56", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-74", 0 ],
                    "source": [ "obj-57", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-52", 0 ],
                    "source": [ "obj-59", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-12", 1 ],
                    "source": [ "obj-6", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-58", 0 ],
                    "source": [ "obj-60", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-24", 0 ],
                    "source": [ "obj-62", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-22", 0 ],
                    "source": [ "obj-63", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-262", 0 ],
                    "source": [ "obj-64", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-62", 0 ],
                    "source": [ "obj-64", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-86", 2 ],
                    "midpoints": [ 176.5, 585.0, 384.5, 585.0, 384.5, 459.0, 365.5, 459.0 ],
                    "source": [ "obj-65", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-346", 5 ],
                    "source": [ "obj-66", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-74", 0 ],
                    "source": [ "obj-67", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-72", 0 ],
                    "source": [ "obj-69", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-346", 3 ],
                    "source": [ "obj-7", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-53", 0 ],
                    "source": [ "obj-70", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-10", 0 ],
                    "source": [ "obj-71", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-114", 0 ],
                    "source": [ "obj-71", 13 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-13", 0 ],
                    "source": [ "obj-71", 6 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-14", 0 ],
                    "source": [ "obj-71", 7 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-15", 0 ],
                    "source": [ "obj-71", 8 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-16", 0 ],
                    "source": [ "obj-71", 9 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-17", 0 ],
                    "source": [ "obj-71", 10 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-18", 0 ],
                    "source": [ "obj-71", 11 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-19", 0 ],
                    "source": [ "obj-71", 12 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-23", 0 ],
                    "source": [ "obj-71", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 0 ],
                    "source": [ "obj-71", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-66", 0 ],
                    "source": [ "obj-71", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-7", 0 ],
                    "source": [ "obj-71", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9", 0 ],
                    "source": [ "obj-71", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-77", 0 ],
                    "source": [ "obj-72", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-46", 1 ],
                    "source": [ "obj-74", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-48", 0 ],
                    "source": [ "obj-74", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-70", 0 ],
                    "source": [ "obj-76", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-67", 0 ],
                    "source": [ "obj-77", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-86", 1 ],
                    "source": [ "obj-81", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-64", 0 ],
                    "source": [ "obj-83", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20", 0 ],
                    "source": [ "obj-86", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-65", 0 ],
                    "midpoints": [ 20.5, 535.0, 176.5, 535.0 ],
                    "source": [ "obj-87", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-346", 4 ],
                    "source": [ "obj-9", 0 ]
                }
            }
        ],
        "parameters": {
            "obj-112": [ "live.text[10]", "live.text", 0 ],
            "parameterbanks": {
                "0": {
                    "index": 0,
                    "name": "",
                    "parameters": [ "-", "-", "-", "-", "-", "-", "-", "-" ],
                    "buttons": [ "-", "-", "-", "-", "-", "-", "-", "-" ]
                }
            },
            "inherited_shortname": 1
        },
        "autosave": 0,
        "toolbaradditions": [ "packagemanager" ],
        "toolbarexclusions": [ "mixerslider", "quickrecord", "showsnapshots", "showmappings" ],
        "bgcolor": [ 0.00784313725490196, 0.00784313725490196, 0.1411764705882353, 0.532513661202186 ]
    }
}