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
        "rect": [ 665.0, 273.0, 1163.0, 873.0 ],
        "openinpresentation": 1,
        "boxes": [
            {
                "box": {
                    "bgcolor": [ 0.4627450980392157, 0.8509803921568627, 0.8431372549019608, 1.0 ],
                    "fontface": 1,
                    "fontname": "Ableton Sans Medium",
                    "id": "obj-1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 929.0, 444.0, 93.0, 21.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 63.0, 147.0, 32.0, 21.0 ],
                    "text": "FPS",
                    "textcolor": [ 0.043137254901960784, 0.00392156862745098, 0.14901960784313725, 1.0 ]
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
                    "id": "obj-121",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "offset": [ 0.0, 0.0 ],
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
                        "rect": [ 732.0, 482.0, 1227.0, 842.0 ],
                        "openinpresentation": 1,
                        "boxes": [
                            {
                                "box": {
                                    "id": "obj-16",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 178.0, 428.0, 118.0, 22.0 ],
                                    "text": "route debug-console"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-2",
                                    "maxclass": "button",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 308.0, 171.0, 24.0, 24.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-19",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 285.0, 664.0, 32.0, 22.0 ],
                                    "text": "print"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-20",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 285.0, 634.0, 91.0, 22.0 ],
                                    "text": "routepass baud"
                                }
                            },
                            {
                                "box": {
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-21",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 200.0, 696.0, 98.0, 22.0 ],
                                    "text": "prepend append"
                                }
                            },
                            {
                                "box": {
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-22",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 200.0, 664.0, 49.0, 22.0 ],
                                    "text": "zl iter 1"
                                }
                            },
                            {
                                "box": {
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-23",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 200.0, 634.0, 62.0, 22.0 ],
                                    "text": "route port"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-17",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 54.0, 63.0, 48.0, 22.0 ],
                                    "text": "del 100"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-13",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 4,
                                    "outlettype": [ "bang", "bang", "bang", "bang" ],
                                    "patching_rect": [ 54.0, 136.0, 199.0, 22.0 ],
                                    "text": "b 4"
                                }
                            },
                            {
                                "box": {
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
                                    "patching_rect": [ 54.0, 94.0, 199.0, 32.0 ],
                                    "presentation": 1,
                                    "presentation_rect": [ 6.0, 4.0, 146.0, 26.0 ],
                                    "saved_attribute_attributes": {
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
                                    "patching_rect": [ 174.0, 258.0, 71.0, 22.0 ],
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
                                    "patching_rect": [ 174.0, 218.0, 156.0, 22.0 ],
                                    "text": "t \"set usbmodem40590801\""
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-327",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "open" ],
                                    "patching_rect": [ 54.0, 218.0, 42.0, 22.0 ],
                                    "text": "t open"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-326",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 54.0, 178.0, 48.0, 22.0 ],
                                    "text": "del 400"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-324",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 114.0, 178.0, 48.0, 22.0 ],
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
                                    "patching_rect": [ 174.0, 178.0, 48.0, 22.0 ],
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
                                    "patching_rect": [ 54.0, 34.0, 58.0, 22.0 ],
                                    "text": "loadbang"
                                }
                            },
                            {
                                "box": {
                                    "fontname": "Ableton Sans Medium",
                                    "fontsize": 13.0,
                                    "id": "obj-3",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 374.0, 505.0, 62.0, 24.0 ],
                                    "presentation": 1,
                                    "presentation_rect": [ 90.0, 59.0, 62.0, 24.0 ],
                                    "text": "getbaud"
                                }
                            },
                            {
                                "box": {
                                    "fontname": "Arial",
                                    "fontsize": 11.59,
                                    "id": "obj-4",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "open", "" ],
                                    "patching_rect": [ 178.0, 505.0, 49.0, 21.0 ],
                                    "text": "t open l"
                                }
                            },
                            {
                                "box": {
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-5",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 178.0, 472.0, 87.0, 22.0 ],
                                    "text": "sprintf port %s"
                                }
                            },
                            {
                                "box": {
                                    "allowdrag": 0,
                                    "fontname": "Ableton Sans Medium",
                                    "id": "obj-7",
                                    "items": [ "debug-console", ",", "MINIRIG4", ",", "Bluetooth-Incoming-Port" ],
                                    "maxclass": "umenu",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "int", "", "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 114.5, 391.0, 146.0, 23.0 ],
                                    "presentation": 1,
                                    "presentation_rect": [ 6.0, 32.0, 146.0, 23.0 ]
                                }
                            },
                            {
                                "box": {
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-9",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "print", "clear" ],
                                    "patching_rect": [ 234.0, 308.0, 68.0, 22.0 ],
                                    "text": "t print clear"
                                }
                            },
                            {
                                "box": {
                                    "fontname": "Ableton Sans Medium",
                                    "id": "obj-10",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 332.0, 505.0, 38.0, 23.0 ],
                                    "presentation": 1,
                                    "presentation_rect": [ 48.0, 59.0, 38.0, 23.0 ],
                                    "text": "close"
                                }
                            },
                            {
                                "box": {
                                    "fontname": "Ableton Sans Medium",
                                    "id": "obj-11",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 288.0, 505.0, 37.0, 23.0 ],
                                    "presentation": 1,
                                    "presentation_rect": [ 6.0, 59.0, 37.0, 23.0 ],
                                    "text": "open"
                                }
                            },
                            {
                                "box": {
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-12",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "int", "" ],
                                    "patching_rect": [ 54.0, 586.0, 165.0, 22.0 ],
                                    "text": "serial c 115200 @autoopen 0"
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-120",
                                    "index": 1,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 95.0, 496.0, 30.0, 30.0 ]
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-12", 0 ],
                                    "source": [ "obj-10", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-12", 0 ],
                                    "source": [ "obj-11", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-13", 0 ],
                                    "source": [ "obj-112", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-20", 0 ],
                                    "order": 0,
                                    "source": [ "obj-12", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-23", 0 ],
                                    "order": 1,
                                    "source": [ "obj-12", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-12", 0 ],
                                    "source": [ "obj-120", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-323", 0 ],
                                    "source": [ "obj-13", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-324", 0 ],
                                    "source": [ "obj-13", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-326", 0 ],
                                    "source": [ "obj-13", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-9", 0 ],
                                    "source": [ "obj-13", 3 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-17", 0 ],
                                    "source": [ "obj-135", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-5", 0 ],
                                    "source": [ "obj-16", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-7", 0 ],
                                    "midpoints": [ 183.5, 336.0, 124.0, 336.0 ],
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
                                    "destination": [ "obj-112", 0 ],
                                    "source": [ "obj-17", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-168", 0 ],
                                    "source": [ "obj-2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-19", 0 ],
                                    "source": [ "obj-20", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-7", 0 ],
                                    "midpoints": [ 209.5, 764.0, 457.0, 764.0, 457.0, 375.0, 124.0, 375.0 ],
                                    "source": [ "obj-21", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-21", 0 ],
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-22", 0 ],
                                    "source": [ "obj-23", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-12", 0 ],
                                    "source": [ "obj-3", 0 ]
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
                                    "destination": [ "obj-7", 0 ],
                                    "source": [ "obj-324", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-327", 0 ],
                                    "source": [ "obj-326", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-12", 0 ],
                                    "source": [ "obj-327", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-12", 0 ],
                                    "source": [ "obj-4", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-12", 0 ],
                                    "source": [ "obj-4", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-4", 0 ],
                                    "source": [ "obj-5", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-16", 0 ],
                                    "source": [ "obj-7", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-12", 0 ],
                                    "midpoints": [ 243.5, 349.0, 63.5, 349.0 ],
                                    "source": [ "obj-9", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-7", 0 ],
                                    "midpoints": [ 292.5, 362.0, 124.0, 362.0 ],
                                    "source": [ "obj-9", 1 ]
                                }
                            }
                        ],
                        "toolbaradditions": [ "packagemanager" ],
                        "toolbarexclusions": [ "mixerslider", "quickrecord", "showsnapshots", "showmappings" ]
                    },
                    "patching_rect": [ 249.0, 688.0, 160.0, 91.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 10.0, 9.0, 160.0, 91.0 ],
                    "viewvisibility": 1
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
                            "revision": 1,
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
                    "patching_rect": [ 271.0, 547.0, 178.0, 46.0 ],
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
                    "patching_rect": [ 49.0, 455.0, 48.0, 22.0 ],
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
                    "patching_rect": [ 49.0, 180.0, 83.0, 22.0 ],
                    "text": "loadmess 160"
                }
            },
            {
                "box": {
                    "id": "obj-110",
                    "maxclass": "number",
                    "maximum": 360,
                    "minimum": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 49.0, 218.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 10.0, 146.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-108",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 77.0, 262.0, 152.0, 22.0 ],
                    "text": "prepend framesPerSecond"
                }
            },
            {
                "box": {
                    "id": "obj-71",
                    "maxclass": "newobj",
                    "numinlets": 13,
                    "numoutlets": 13,
                    "outlettype": [ "", "", "", "", "", "", "", "", "", "", "", "", "" ],
                    "patching_rect": [ 249.0, 353.0, 601.0, 22.0 ],
                    "text": "route brightness radius palette divisions width curve rotation fadeIn fadeOut peakPosition pattern gradientOffset"
                }
            },
            {
                "box": {
                    "id": "obj-66",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 867.0, 234.0, 69.0, 22.0 ],
                    "text": "prepend 21"
                }
            },
            {
                "box": {
                    "id": "obj-65",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 778.0, 195.0, 69.0, 22.0 ],
                    "text": "prepend 20"
                }
            },
            {
                "box": {
                    "id": "obj-64",
                    "maxclass": "newobj",
                    "numinlets": 7,
                    "numoutlets": 2,
                    "outlettype": [ "int", "" ],
                    "patching_rect": [ 687.0, 278.0, 82.0, 22.0 ],
                    "text": "midiformat"
                }
            },
            {
                "box": {
                    "id": "obj-462",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 867.0, 195.0, 101.0, 22.0 ],
                    "text": "r \"is tuba playing\""
                }
            },
            {
                "box": {
                    "id": "obj-62",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 778.0, 156.0, 101.0, 22.0 ],
                    "text": "r \"is tuba soloing\""
                }
            },
            {
                "box": {
                    "autosave": 0,
                    "id": "obj-57",
                    "inletInfo": {
                        "IOInfo": [
                            {
                                "type": "signal",
                                "index": 1,
                                "tag": "in1",
                                "comment": "main phasor"
                            },
                            {
                                "type": "signal",
                                "index": 2,
                                "tag": "in2",
                                "comment": "subdiv phasor"
                            },
                            {
                                "type": "signal",
                                "index": 3,
                                "tag": "in3",
                                "comment": "dry/wet mix amount"
                            },
                            {
                                "type": "signal",
                                "index": 4,
                                "tag": "in4",
                                "comment": "LPF freq mod"
                            },
                            {
                                "type": "signal",
                                "index": 5,
                                "tag": "in5",
                                "comment": "sub amp mod"
                            },
                            {
                                "type": "signal",
                                "index": 6,
                                "tag": "in6",
                                "comment": "tuba envelope"
                            },
                            {
                                "type": "midi",
                                "index": -1,
                                "tag": "",
                                "comment": ""
                            }
                        ]
                    },
                    "maxclass": "newobj",
                    "numinlets": 7,
                    "numoutlets": 1,
                    "outletInfo": {
                        "IOInfo": []
                    },
                    "outlettype": [ "list" ],
                    "patching_rect": [ 249.0, 313.0, 457.0, 22.0 ],
                    "rnboattrcache": {
                        "framesPerSecond": {
                            "label": "framesPerSecond",
                            "isEnum": 0,
                            "parsestring": ""
                        }
                    },
                    "rnboversion": "1.4.2",
                    "saved_object_attributes": {
                        "autosave": 0,
                        "optimization": "O1",
                        "parameter_enable": 0,
                        "uuid": "541ac891-dc0a-11f0-8891-a2f417e70586"
                    },
                    "text": "rnbo~ @patchername SousaVFX @parameter_enable 0 @autosave 0 @autobuild 0",
                    "varname": "rnbo~"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.07843137254902, 0.07843137254902, 0.07843137254902, 1.0 ],
                    "color": [ 0.10196078431372549, 0.5098039215686274, 0.796078431372549, 1.0 ],
                    "id": "obj-53",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 541.0, 183.0, 178.0, 22.0 ],
                    "text": "r~ Low_Amp_Mod_w_tuba_env",
                    "textcolor": [ 0.647058823529412, 1.0, 0.725490196078431, 1.0 ]
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
                    "patching_rect": [ 468.0, 147.0, 180.0, 22.0 ],
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
                    "patching_rect": [ 249.0, 41.0, 92.0, 22.0 ],
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
                    "patching_rect": [ 395.0, 112.0, 205.0, 22.0 ],
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
                    "patching_rect": [ 322.0, 76.0, 275.0, 22.0 ],
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
                    "patching_rect": [ 614.0, 218.0, 127.0, 22.0 ],
                    "text": "r~ tuba_env_w_delrev",
                    "textcolor": [ 0.647058823529412, 1.0, 0.725490196078431, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-51",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 249.0, 511.0, 67.0, 22.0 ],
                    "text": "speedlim 5"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.4627450980392157, 0.8509803921568627, 0.8431372549019608, 1.0 ],
                    "fontface": 1,
                    "fontname": "Ableton Sans Medium",
                    "id": "obj-49",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 914.0, 429.0, 93.0, 21.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 283.0, 37.0, 93.0, 21.0 ],
                    "text": "gradientOffset",
                    "textcolor": [ 0.043137254901960784, 0.00392156862745098, 0.14901960784313725, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-50",
                    "ignoreclick": 1,
                    "maxclass": "number",
                    "maximum": 253,
                    "minimum": 0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 858.0, 428.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 227.0, 36.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.4627450980392157, 0.8509803921568627, 0.8431372549019608, 1.0 ],
                    "fontface": 1,
                    "fontname": "Ableton Sans Medium",
                    "id": "obj-39",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 895.0, 457.0, 56.0, 21.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 264.0, 65.0, 56.0, 21.0 ],
                    "text": "pattern",
                    "textcolor": [ 0.043137254901960784, 0.00392156862745098, 0.14901960784313725, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-48",
                    "ignoreclick": 1,
                    "maxclass": "number",
                    "maximum": 253,
                    "minimum": 0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 841.0, 456.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 210.0, 64.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.4627450980392157, 0.8509803921568627, 0.8431372549019608, 1.0 ],
                    "fontface": 1,
                    "fontname": "Ableton Sans Medium",
                    "id": "obj-24",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 883.0, 484.0, 89.0, 21.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 252.0, 92.0, 89.0, 21.0 ],
                    "text": "peak position",
                    "textcolor": [ 0.043137254901960784, 0.00392156862745098, 0.14901960784313725, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-27",
                    "ignoreclick": 1,
                    "maxclass": "number",
                    "maximum": 253,
                    "minimum": 0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 824.0, 483.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 193.0, 91.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.4627450980392157, 0.8509803921568627, 0.8431372549019608, 1.0 ],
                    "fontface": 1,
                    "fontname": "Ableton Sans Medium",
                    "id": "obj-11",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 865.0, 512.0, 60.0, 21.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 234.0, 120.0, 60.0, 21.0 ],
                    "text": "fade out",
                    "textcolor": [ 0.043137254901960784, 0.00392156862745098, 0.14901960784313725, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-12",
                    "ignoreclick": 1,
                    "maxclass": "number",
                    "maximum": 253,
                    "minimum": 0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 807.0, 511.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 176.0, 119.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.4627450980392157, 0.8509803921568627, 0.8431372549019608, 1.0 ],
                    "fontface": 1,
                    "fontname": "Ableton Sans Medium",
                    "id": "obj-33",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 848.0, 539.0, 60.0, 21.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 217.0, 147.0, 60.0, 21.0 ],
                    "text": "fade in",
                    "textcolor": [ 0.043137254901960784, 0.00392156862745098, 0.14901960784313725, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-34",
                    "ignoreclick": 1,
                    "maxclass": "number",
                    "maximum": 253,
                    "minimum": 0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 790.0, 538.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 159.0, 146.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.4627450980392157, 0.8509803921568627, 0.8431372549019608, 1.0 ],
                    "fontface": 1,
                    "fontname": "Ableton Sans Medium",
                    "id": "obj-47",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 831.0, 567.0, 60.0, 21.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 200.0, 175.0, 60.0, 21.0 ],
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
                    "patching_rect": [ 812.0, 594.0, 85.0, 21.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 181.0, 202.0, 85.0, 21.0 ],
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
                    "patching_rect": [ 795.0, 622.0, 85.0, 21.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 164.0, 230.0, 85.0, 21.0 ],
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
                    "patching_rect": [ 778.0, 649.0, 96.0, 21.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 147.0, 257.0, 96.0, 21.0 ],
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
                    "patching_rect": [ 762.0, 677.0, 53.0, 21.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 131.0, 285.0, 53.0, 21.0 ],
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
                    "patching_rect": [ 741.0, 704.0, 82.0, 21.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 110.0, 312.0, 82.0, 21.0 ],
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
                    "patching_rect": [ 728.0, 732.0, 71.0, 21.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 97.0, 340.0, 71.0, 21.0 ],
                    "text": "brightness",
                    "textcolor": [ 0.043137254901960784, 0.00392156862745098, 0.14901960784313725, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-37",
                    "ignoreclick": 1,
                    "maxclass": "number",
                    "maximum": 253,
                    "minimum": 0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 670.0, 731.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 39.0, 339.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-25",
                    "ignoreclick": 1,
                    "maxclass": "number",
                    "maximum": 253,
                    "minimum": 0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 773.0, 566.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 142.0, 174.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-21",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 875.0, 353.0, 205.0, 22.0 ],
                    "text": "90 253 0 2 201 126 231 59 0 128 0 0"
                }
            },
            {
                "box": {
                    "id": "obj-8",
                    "ignoreclick": 1,
                    "maxclass": "number",
                    "maximum": 253,
                    "minimum": 0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 755.0, 593.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 124.0, 201.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-5",
                    "ignoreclick": 1,
                    "maxclass": "number",
                    "maximum": 253,
                    "minimum": 0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 738.0, 621.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 107.0, 229.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-6",
                    "ignoreclick": 1,
                    "maxclass": "number",
                    "maximum": 253,
                    "minimum": 0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 721.0, 648.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 90.0, 256.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-4",
                    "ignoreclick": 1,
                    "maxclass": "number",
                    "maximum": 253,
                    "minimum": 0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 704.0, 676.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 73.0, 284.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-2",
                    "ignoreclick": 1,
                    "maxclass": "number",
                    "maximum": 253,
                    "minimum": 0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 687.0, 703.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 56.0, 311.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-346",
                    "maxclass": "newobj",
                    "numinlets": 12,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 249.0, 403.0, 552.5, 22.0 ],
                    "text": "pak i i i i i i i i i i i i"
                }
            },
            {
                "box": {
                    "fontname": "Ableton Sans Light",
                    "id": "obj-309",
                    "maxclass": "comment",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "patching_rect": [ 175.0, 652.0, 69.0, 21.0 ],
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
                    "patching_rect": [ 173.0, 612.0, 73.0, 21.0 ],
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
                    "patching_rect": [ 249.0, 651.0, 72.0, 22.0 ],
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
                    "patching_rect": [ 249.0, 611.0, 76.0, 22.0 ],
                    "text": "prepend 254"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-57", 2 ],
                    "source": [ "obj-1077", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-57", 0 ],
                    "source": [ "obj-108", 0 ]
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
                    "destination": [ "obj-345", 0 ],
                    "source": [ "obj-118", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-51", 1 ],
                    "source": [ "obj-119", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-121", 0 ],
                    "source": [ "obj-316", 0 ]
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
                    "destination": [ "obj-51", 0 ],
                    "source": [ "obj-346", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-57", 0 ],
                    "source": [ "obj-426", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-66", 0 ],
                    "source": [ "obj-462", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-345", 0 ],
                    "source": [ "obj-51", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-57", 4 ],
                    "source": [ "obj-53", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-57", 3 ],
                    "source": [ "obj-54", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-57", 1 ],
                    "source": [ "obj-55", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-57", 5 ],
                    "source": [ "obj-56", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-71", 0 ],
                    "source": [ "obj-57", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-65", 0 ],
                    "source": [ "obj-62", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-57", 6 ],
                    "source": [ "obj-64", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-64", 2 ],
                    "source": [ "obj-65", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-64", 2 ],
                    "source": [ "obj-66", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-12", 0 ],
                    "order": 0,
                    "source": [ "obj-71", 8 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2", 0 ],
                    "order": 0,
                    "source": [ "obj-71", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-25", 0 ],
                    "order": 0,
                    "source": [ "obj-71", 6 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-27", 0 ],
                    "order": 0,
                    "source": [ "obj-71", 9 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-34", 0 ],
                    "order": 0,
                    "source": [ "obj-71", 7 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-346", 11 ],
                    "order": 1,
                    "source": [ "obj-71", 11 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-346", 10 ],
                    "order": 1,
                    "source": [ "obj-71", 10 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-346", 9 ],
                    "order": 1,
                    "source": [ "obj-71", 9 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-346", 8 ],
                    "order": 1,
                    "source": [ "obj-71", 8 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-346", 7 ],
                    "order": 1,
                    "source": [ "obj-71", 7 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-346", 6 ],
                    "order": 1,
                    "source": [ "obj-71", 6 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-346", 5 ],
                    "order": 1,
                    "source": [ "obj-71", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-346", 4 ],
                    "order": 1,
                    "source": [ "obj-71", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-346", 3 ],
                    "order": 1,
                    "source": [ "obj-71", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-346", 2 ],
                    "order": 1,
                    "source": [ "obj-71", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-346", 1 ],
                    "order": 1,
                    "source": [ "obj-71", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-346", 0 ],
                    "order": 1,
                    "source": [ "obj-71", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-37", 0 ],
                    "order": 0,
                    "source": [ "obj-71", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4", 0 ],
                    "order": 0,
                    "source": [ "obj-71", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-48", 0 ],
                    "order": 0,
                    "source": [ "obj-71", 10 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "order": 0,
                    "source": [ "obj-71", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-50", 0 ],
                    "order": 0,
                    "source": [ "obj-71", 11 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-6", 0 ],
                    "order": 0,
                    "source": [ "obj-71", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-8", 0 ],
                    "order": 0,
                    "source": [ "obj-71", 5 ]
                }
            }
        ],
        "parameters": {
            "obj-121::obj-112": [ "live.text[10]", "live.text", 0 ],
            "inherited_shortname": 1
        },
        "autosave": 0,
        "toolbaradditions": [ "packagemanager" ],
        "toolbarexclusions": [ "mixerslider", "quickrecord", "showsnapshots", "showmappings" ]
    }
}