{
    "patcher": {
        "fileversion": 1,
        "appversion": {
            "major": 9,
            "minor": 1,
            "revision": 1,
            "architecture": "x64",
            "modernui": 1
        },
        "classnamespace": "box",
        "rect": [ 1197.0, 252.0, 1382.0, 962.0 ],
        "openinpresentation": 1,
        "boxes": [
            {
                "box": {
                    "bgcolor": [ 0.4627450980392157, 0.8509803921568627, 0.8431372549019608, 1.0 ],
                    "fontface": 1,
                    "fontname": "Ableton Sans Medium",
                    "id": "obj-47",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 780.0, 339.78571428571433, 60.0, 21.0 ],
                    "text": "rotation",
                    "textcolor": [ 0.043137254901960784, 0.00392156862745098, 0.14901960784313725, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.4627450980392157, 0.8509803921568627, 0.8431372549019608, 1.0 ],
                    "fontface": 1,
                    "fontname": "Ableton Sans Medium",
                    "id": "obj-46",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 693.0, 312.07142857142867, 85.0, 21.0 ],
                    "text": "curve amount",
                    "textcolor": [ 0.043137254901960784, 0.00392156862745098, 0.14901960784313725, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.4627450980392157, 0.8509803921568627, 0.8431372549019608, 1.0 ],
                    "fontface": 1,
                    "fontname": "Ableton Sans Medium",
                    "id": "obj-45",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 618.0, 284.5, 85.0, 21.0 ],
                    "presentation_linecount": 2,
                    "text": "division width",
                    "textcolor": [ 0.043137254901960784, 0.00392156862745098, 0.14901960784313725, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.4627450980392157, 0.8509803921568627, 0.8431372549019608, 1.0 ],
                    "fontface": 1,
                    "fontname": "Ableton Sans Medium",
                    "id": "obj-44",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 535.0, 257.5, 96.0, 21.0 ],
                    "presentation_linecount": 2,
                    "text": "division number",
                    "textcolor": [ 0.043137254901960784, 0.00392156862745098, 0.14901960784313725, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.4627450980392157, 0.8509803921568627, 0.8431372549019608, 1.0 ],
                    "fontface": 1,
                    "fontname": "Ableton Sans Medium",
                    "id": "obj-43",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 446.0, 228.92857142857144, 53.0, 21.0 ],
                    "text": "palette",
                    "textcolor": [ 0.043137254901960784, 0.00392156862745098, 0.14901960784313725, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.4627450980392157, 0.8509803921568627, 0.8431372549019608, 1.0 ],
                    "fontface": 1,
                    "fontname": "Ableton Sans Medium",
                    "id": "obj-42",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 365.0, 201.21428571428572, 82.0, 21.0 ],
                    "presentation_linecount": 2,
                    "text": "radius cutoff",
                    "textcolor": [ 0.043137254901960784, 0.00392156862745098, 0.14901960784313725, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.4627450980392157, 0.8509803921568627, 0.8431372549019608, 1.0 ],
                    "fontface": 1,
                    "fontname": "Ableton Sans Medium",
                    "id": "obj-41",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 281.0, 174.0, 71.0, 21.0 ],
                    "text": "brightness",
                    "textcolor": [ 0.043137254901960784, 0.00392156862745098, 0.14901960784313725, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-37",
                    "maxclass": "number",
                    "maximum": 253,
                    "minimum": 0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 230.0, 173.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-36",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 790.0, 157.0, 84.0, 22.0 ],
                    "text": "scale~ 0 1 1 0"
                }
            },
            {
                "box": {
                    "id": "obj-35",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 790.0, 256.0, 30.0, 22.0 ],
                    "text": "i"
                }
            },
            {
                "box": {
                    "id": "obj-32",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 790.0, 223.0, 40.0, 22.0 ],
                    "text": "* 253."
                }
            },
            {
                "box": {
                    "id": "obj-31",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 790.0, 190.0, 81.0, 22.0 ],
                    "text": "snapshot~ 32"
                }
            },
            {
                "box": {
                    "id": "obj-29",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 790.0, 124.0, 69.0, 22.0 ],
                    "text": "phasor~ 1n"
                }
            },
            {
                "box": {
                    "id": "obj-27",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 196.0, 452.0, 730.0, 20.0 ],
                    "text": "brightness // radius cutoff // current Pallette Index // pinwheel Divisions // fadeParam // divisionCurveParam // rotationParam"
                }
            },
            {
                "box": {
                    "id": "obj-25",
                    "maxclass": "number",
                    "maximum": 253,
                    "minimum": 0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 726.2857142857146, 339.28571428571433, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-22",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 7,
                    "outlettype": [ "int", "int", "int", "int", "int", "int", "int" ],
                    "patching_rect": [ 230.0000000000001, 134.0, 515.2857142857144, 22.0 ],
                    "text": "unpack i i i i i i i"
                }
            },
            {
                "box": {
                    "id": "obj-21",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 230.0000000000001, 95.0, 122.0, 22.0 ],
                    "text": "90 253 0 3 126 126 0"
                }
            },
            {
                "box": {
                    "id": "obj-9",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "bang" ],
                    "patching_rect": [ 314.0, 546.0, 29.5, 22.0 ],
                    "text": "b 2"
                }
            },
            {
                "box": {
                    "id": "obj-7",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 358.0, 629.0, 55.0, 22.0 ],
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
                    "patching_rect": [ 371.0, 595.0, 39.0, 22.0 ],
                    "text": "click~"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.917647058823529, 1.0, 1.0, 1.0 ],
                    "fontname": "Monaco",
                    "id": "obj-234",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "patching_rect": [ 353.0, 535.0, 127.0, 36.0 ],
                    "suppressinlet": 1,
                    "text": "helps set render delay in OBS",
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
                    "patching_rect": [ 296.0, 629.0, 41.0, 22.0 ],
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
                    "patching_rect": [ 314.0, 508.0, 26.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-202",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 256.0, 629.0, 29.0, 22.0 ],
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
                    "patching_rect": [ 256.0, 595.0, 47.0, 22.0 ],
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
                    "patching_rect": [ 296.0, 689.0, 22.0, 22.0 ],
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
                    "patching_rect": [ 256.0, 721.0, 78.0, 49.0 ],
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
                    "patching_rect": [ 296.0, 659.0, 47.0, 22.0 ],
                    "text": "uzi 624"
                }
            },
            {
                "box": {
                    "id": "obj-8",
                    "maxclass": "number",
                    "maximum": 253,
                    "minimum": 0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 643.5714285714288, 311.5714285714286, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-5",
                    "maxclass": "number",
                    "maximum": 253,
                    "minimum": 0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 560.857142857143, 283.8571428571429, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-1",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 373.0, 26.0, 118.0, 22.0 ],
                    "text": "s pinwheel_divisions"
                }
            },
            {
                "box": {
                    "id": "obj-6",
                    "maxclass": "number",
                    "maximum": 253,
                    "minimum": 0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 478.1428571428572, 256.14285714285717, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-4",
                    "maxclass": "number",
                    "maximum": 253,
                    "minimum": 0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 395.42857142857144, 228.42857142857144, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-2",
                    "maxclass": "number",
                    "maximum": 253,
                    "minimum": 0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 312.7142857142857, 200.71428571428572, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-384",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 262.0, 26.0, 100.0, 22.0 ],
                    "text": "r wobble_or_solo"
                }
            },
            {
                "box": {
                    "id": "obj-376",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 125.0, 26.0, 121.0, 22.0 ],
                    "text": "r vfx_palette_number"
                }
            },
            {
                "box": {
                    "id": "obj-257",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 51.0, 26.0, 57.0, 22.0 ],
                    "text": "r vfx_env"
                }
            },
            {
                "box": {
                    "id": "obj-19",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 230.0, 864.0, 73.0, 22.0 ],
                    "text": "speedlim 16"
                }
            },
            {
                "box": {
                    "fontsize": 22.977709580595253,
                    "id": "obj-20",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 74.0, 915.0, 378.0, 34.0 ],
                    "presentation": 1,
                    "presentation_linecount": 2,
                    "presentation_rect": [ 38.0, 137.0, 229.0, 60.0 ],
                    "text": "254 90 253 0 3 126 126 40 255"
                }
            },
            {
                "box": {
                    "id": "obj-40",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 620.0, 778.0, 54.0, 22.0 ],
                    "text": "deferlow"
                }
            },
            {
                "box": {
                    "id": "obj-346",
                    "maxclass": "newobj",
                    "numinlets": 7,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 230.0, 380.0, 515.2857142857144, 22.0 ],
                    "text": "pak i i i i i i i"
                }
            },
            {
                "box": {
                    "fontname": "Ableton Sans Light",
                    "id": "obj-309",
                    "maxclass": "comment",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "patching_rect": [ 156.0, 826.0, 69.0, 21.0 ],
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
                    "patching_rect": [ 154.0, 786.0, 73.0, 21.0 ],
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
                    "patching_rect": [ 230.0, 825.0, 72.0, 22.0 ],
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
                    "patching_rect": [ 230.0, 785.0, 76.0, 22.0 ],
                    "text": "prepend 254"
                }
            },
            {
                "box": {
                    "automation": "1",
                    "automationon": "2",
                    "fontname": "Monaco",
                    "fontsize": 12.0,
                    "id": "obj-113",
                    "maxclass": "live.text",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 620.0, 813.0, 199.0, 32.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 38.0, 106.0, 146.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "1", "2" ],
                            "parameter_longname": "live.text[11]",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "live.text",
                            "parameter_type": 2
                        }
                    },
                    "text": "Open Serial Port",
                    "texton": "Acoustic Auto-switch Active",
                    "varname": "live.text[11]"
                }
            },
            {
                "box": {
                    "id": "obj-60",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 816.0, 1001.0, 32.0, 22.0 ],
                    "text": "print"
                }
            },
            {
                "box": {
                    "id": "obj-59",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 816.0, 971.0, 91.0, 22.0 ],
                    "text": "routepass baud"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 13.0,
                    "id": "obj-440",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 706.0, 857.0, 59.0, 23.0 ],
                    "text": "getbaud"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 11.59,
                    "id": "obj-16",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "open", "" ],
                    "patching_rect": [ 568.0, 736.0, 49.0, 21.0 ],
                    "text": "t open l"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-76",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 568.0, 703.0, 87.0, 22.0 ],
                    "text": "sprintf port %s"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-90",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 731.0, 1033.0, 98.0, 22.0 ],
                    "text": "prepend append"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-18",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 731.0, 1001.0, 49.0, 22.0 ],
                    "text": "zl iter 1"
                }
            },
            {
                "box": {
                    "allowdrag": 0,
                    "id": "obj-38",
                    "items": [ "debug-console", ",", "MINIRIG4", ",", "Bluetooth-Incoming-Port", ",", "usbmodem40590801" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 587.0, 659.0, 146.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 38.0, 79.0, 146.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-63",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 538.0, 550.0, 36.0, 36.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 38.0, 36.0, 36.0, 36.0 ]
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-67",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "print", "clear" ],
                    "patching_rect": [ 538.0, 603.0, 68.0, 22.0 ],
                    "text": "t print clear"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-68",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 731.0, 971.0, 62.0, 22.0 ],
                    "text": "route port"
                }
            },
            {
                "box": {
                    "id": "obj-74",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 664.0, 857.0, 39.0, 22.0 ],
                    "text": "close"
                }
            },
            {
                "box": {
                    "id": "obj-77",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 620.0, 857.0, 37.0, 22.0 ],
                    "text": "open"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-80",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "int", "" ],
                    "patching_rect": [ 538.0, 908.0, 165.0, 22.0 ],
                    "text": "serial c 115200 @autoopen 0"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-77", 0 ],
                    "source": [ "obj-113", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-345", 0 ],
                    "source": [ "obj-14", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-80", 0 ],
                    "source": [ "obj-16", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-80", 0 ],
                    "source": [ "obj-16", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-90", 0 ],
                    "source": [ "obj-18", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20", 1 ],
                    "source": [ "obj-19", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-346", 1 ],
                    "source": [ "obj-2", 0 ]
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
                    "destination": [ "obj-22", 0 ],
                    "source": [ "obj-21", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2", 0 ],
                    "source": [ "obj-22", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-25", 0 ],
                    "source": [ "obj-22", 6 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-37", 0 ],
                    "source": [ "obj-22", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4", 0 ],
                    "source": [ "obj-22", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "source": [ "obj-22", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-6", 0 ],
                    "source": [ "obj-22", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-8", 0 ],
                    "source": [ "obj-22", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-346", 6 ],
                    "source": [ "obj-25", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-36", 0 ],
                    "source": [ "obj-29", 0 ]
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
                    "destination": [ "obj-32", 0 ],
                    "source": [ "obj-31", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-19", 0 ],
                    "order": 1,
                    "source": [ "obj-316", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-80", 0 ],
                    "order": 0,
                    "source": [ "obj-316", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-35", 0 ],
                    "source": [ "obj-32", 0 ]
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
                    "destination": [ "obj-345", 0 ],
                    "source": [ "obj-346", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-25", 0 ],
                    "source": [ "obj-35", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-31", 0 ],
                    "source": [ "obj-36", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-346", 0 ],
                    "source": [ "obj-37", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-76", 0 ],
                    "source": [ "obj-38", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-346", 2 ],
                    "source": [ "obj-4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-113", 0 ],
                    "source": [ "obj-40", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-80", 0 ],
                    "source": [ "obj-440", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-346", 4 ],
                    "source": [ "obj-5", 0 ]
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
                    "destination": [ "obj-60", 0 ],
                    "source": [ "obj-59", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-346", 3 ],
                    "source": [ "obj-6", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-67", 0 ],
                    "source": [ "obj-63", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-38", 0 ],
                    "source": [ "obj-67", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-80", 0 ],
                    "source": [ "obj-67", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-18", 0 ],
                    "source": [ "obj-68", 0 ]
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
                    "destination": [ "obj-80", 0 ],
                    "source": [ "obj-74", 0 ]
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
                    "destination": [ "obj-16", 0 ],
                    "source": [ "obj-76", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-80", 0 ],
                    "source": [ "obj-77", 0 ]
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
                    "destination": [ "obj-346", 5 ],
                    "source": [ "obj-8", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-59", 0 ],
                    "order": 0,
                    "source": [ "obj-80", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-68", 0 ],
                    "order": 1,
                    "source": [ "obj-80", 1 ]
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
            },
            {
                "patchline": {
                    "destination": [ "obj-38", 0 ],
                    "midpoints": [ 740.5, 1067.1667312383652, 715.0000067949295, 1067.1667312383652, 715.0000067949295, 929.1667305231094, 842.3333452939987, 929.1667305231094, 842.3333452939987, 641.833397269249, 596.5, 641.833397269249 ],
                    "source": [ "obj-90", 0 ]
                }
            }
        ],
        "parameters": {
            "obj-113": [ "live.text[11]", "live.text", 0 ],
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
        "toolbarexclusions": [ "mixerslider", "quickrecord", "showsnapshots", "showmappings" ]
    }
}