module Service.AMEDAS.Stations
    ( station
    , stations
    ) where

import Data.List (find)
import qualified Data.Text as T

import Service.AMEDAS.Types (Station(Station))
import qualified Service.AMEDAS.Types as Types


station :: T.Text ->
           Maybe Station
station name = find ((== name) . Types.name) allStations


stations :: (Float, Float) ->
            (Float, Float) ->
            [Station]
stations (nwLat, nwLng) (seLat, seLng) = filter f allStations
  where
    f (Station _ _ lat lng _) = seLat <= lat && lat <= nwLat &&
                                nwLng <= lng && lng <= seLng


allStations :: [Station]
allStations =
    [ Station 34  0242 (c 38 54.4) (c 141 33.4) "Kesennuma"
    , Station 34  0243 (c 38 44.6) (c 140 45.6) "Kawatabi"
    , Station 34  0244 (c 38 44.1) (c 141 00.3) "Tsukidate"
    , Station 34  0246 (c 38 40.9) (c 141 26.9) "Shidugawa"
    , Station 34  0247 (c 38 35.9) (c 140 54.7) "Furukawa"
    , Station 34  0248 (c 38 28.4) (c 140 53.3) "Oohira"
    , Station 34  0249 (c 38 27.6) (c 141 05.5) "Kashimadai"
    , Station 34  0251 (c 38 18.2) (c 140 38.2) "Nikkawa"
    , Station 34  0256 (c 38 00.9) (c 140 36.7) "Shiroishi"
    , Station 34  0257 (c 38 01.5) (c 140 51.5) "Watari"
    , Station 34  1029 (c 38 37.6) (c 141 11.3) "Yoneyama"
    , Station 34  1030 (c 38 20.3) (c 141 00.8) "Shiogama"
    , Station 34  1126 (c 38 54.8) (c 140 49.7) "Komanoyu"
    , Station 34  1220 (c 37 55.9) (c 140 46.7) "Marumori"
    , Station 34  1290 (c 38 23.9) (c 141 35.8) "Enoshima"
    , Station 34  1464 (c 38 08.3) (c 140 55.0) "Natori"
    , Station 34  1564 (c 38 07.6) (c 140 40.8) "Zao"
    , Station 34  1626 (c 38 27.2) (c 141 26.4) "Onagawa"
    , Station 34  1630 (c 38 33.6) (c 141 14.7) "Monou"
    , Station 34  1631 (c 38 25.6) (c 141 12.8) "Higashimatsushima"
    , Station 34 47592 (c 38 25.6) (c 141 17.9) "Ishinomaki"
    , Station 34 47590 (c 38 15.7) (c 140 53.8) "Sendai"

    , Station 35  0260 (c 38 55.1) (c 140 12.0) "Sasunabe"
    , Station 35  0262 (c 38 52.7) (c 140 19.9) "Kaneyama"
    , Station 35  0263 (c 38 44.1) (c 139 49.7) "Tsuruoka"
    , Station 35  0264 (c 38 48.0) (c 139 58.4) "Karikawa"
    , Station 35  0272 (c 38 22.2) (c 140 11.5) "Aterazawa"
    , Station 35  0275 (c 38 06.3) (c 140 00.9) "Nagai"
    , Station 35  0277 (c 38 04.7) (c 139 44.1) "Oguni"
    , Station 35  0278 (c 37 59.9) (c 139 57.4) "Takamine"
    , Station 35  0279 (c 37 54.7) (c 140 08.6) "Yonezawa"
    , Station 35  0910 (c 38 45.5) (c 140 31.0) "Mukaimachi"
    , Station 35  1039 (c 38 36.5) (c 140 24.7) "Obanazawa"
    , Station 35  1040 (c 38 34.0) (c 139 33.1) "Nezugaseki"
    , Station 35  1125 (c 38 36.4) (c 140 09.8) "Hijiori"
    , Station 35  1132 (c 38 00.2) (c 140 12.4) "Takahata"
    , Station 35  1291 (c 39 11.0) (c 139 32.6) "Tobishima"
    , Station 35  1292 (c 38 23.4) (c 139 59.6) "Ooisawa"
    , Station 35  1488 (c 38 24.7) (c 140 22.2) "Higashine"
    , Station 35  1539 (c 38 27.6) (c 140 20.9) "Murayama"
    , Station 35 47520 (c 38 45.4) (c 140 18.7) "Shinjo"
    , Station 35 47587 (c 38 54.5) (c 139 50.6) "Sakata"
    , Station 35 47588 (c 38 15.3) (c 140 20.7) "Yamagata"

    , Station 36  0281 (c 37 51.1) (c 140 35.3) "Yanagawa"
    , Station 36  0285 (c 37 47.0) (c 140 55.5) "Souma"
    , Station 36  0286 (c 37 39.5) (c 139 51.8) "Kitakata"
    , Station 36  0290 (c 37 33.3) (c 140 07.3) "Inawashiro"
    , Station 36  0291 (c 37 35.0) (c 140 25.8) "Nihonmatsu"
    , Station 36  0294 (c 37 26.1) (c 140 34.6) "Funehiki"
    , Station 36  0295 (c 37 29.5) (c 140 57.9) "Namie"
    , Station 36  0297 (c 37 20.6) (c 139 18.8) "Tadami"
    , Station 36  0299 (c 37 22.1) (c 140 19.8) "Koriyama"
    , Station 36  0301 (c 37 15.9) (c 139 32.2) "Nangou"
    , Station 36  0303 (c 37 12.4) (c 139 47.7) "Tajima"
    , Station 36  0304 (c 37 17.2) (c 140 37.5) "Ononiimachi"
    , Station 36  0307 (c 37 08.8) (c 140 27.6) "Ishikawa"
    , Station 36  0312 (c 36 56.3) (c 140 24.5) "Higashishirakawa"
    , Station 36  1031 (c 37 35.3) (c 139 39.4) "Nishiaizu"
    , Station 36  1034 (c 37 14.0) (c 141 00.0) "Hirono"
    , Station 36  1044 (c 37 28.4) (c 139 31.7) "Kaneyama"
    , Station 36  1116 (c 37 40.1) (c 140 15.6) "Washikura"
    , Station 36  1129 (c 37 20.2) (c 140 48.5) "Kawauchi"
    , Station 36  1130 (c 37 41.7) (c 140 44.8) "Iitate"
    , Station 36  1282 (c 37 43.3) (c 140 03.5) "Hibara"
    , Station 36  1293 (c 37 53.5) (c 140 26.2) "Moniwa"
    , Station 36  1294 (c 37 16.6) (c 140 03.8) "Yumoto"
    , Station 36  1295 (c 37 01.4) (c 139 23.2) "Hinoemata"
    , Station 36  1466 (c 37 13.6) (c 140 25.6) "Tamakawa"
    , Station 36  1607 (c 36 56.0) (c 140 44.0) "Yamada"
    , Station 36  1633 (c 37 52.5) (c 140 55.1) "Shinchi"
    , Station 36  1634 (c 37 05.4) (c 140 33.6) "Furudono"
    , Station 36 47570 (c 37 29.3) (c 139 54.6) "Wakamatsu"
    , Station 36 47595 (c 37 45.5) (c 140 28.2) "Fukushima"
    , Station 36 47597 (c 37 07.9) (c 140 12.9) "Shirakawa"
    , Station 36 47598 (c 36 56.8) (c 140 54.2) "Onahama"

    , Station 40  0315 (c 36 50.0) (c 140 46.3) "Kitaibaraki"
    , Station 40  0316 (c 36 46.7) (c 140 20.7) "Daigo"
    , Station 40  0318 (c 36 23.0) (c 140 14.2) "Kasama"
    , Station 40  0320 (c 36 12.1) (c 139 43.0) "Koga"
    , Station 40  0322 (c 36 10.1) (c 139 56.7) "Shimotsuma"
    , Station 40  0324 (c 36 06.2) (c 140 13.2) "Tsuchiura"
    , Station 40  0325 (c 35 57.8) (c 140 37.3) "Kashima"
    , Station 40  1011 (c 36 34.8) (c 140 38.7) "Hitachi"
    , Station 40  1014 (c 35 53.4) (c 140 12.7) "Ryugasaki"
    , Station 40  1245 (c 36 10.1) (c 140 31.6) "Hokota"
    , Station 40  1331 (c 36 36.4) (c 140 19.5) "Hitachioomiya"
    , Station 40  1530 (c 36 16.9) (c 139 59.3) "Shimodate"
    , Station 40  1635 (c 36 42.2) (c 140 43.0) "Takahagi"
    , Station 40 47629 (c 36 22.8) (c 140 28.0) "Mito"
    , Station 40 47646 (c 36 03.4) (c 140 07.5) "Tsukuba"

    , Station 41  0326 (c 37 07.4) (c 140 02.1) "Nasu"
    , Station 41  0329 (c 36 58.9) (c 140 01.1) "Kuroiso"
    , Station 41  0331 (c 36 50.4) (c 140 02.1) "Ootawara"
    , Station 41  0335 (c 36 35.5) (c 139 44.1) "Kanuma"
    , Station 41  0338 (c 36 28.6) (c 139 59.2) "Mooka"
    , Station 41  0341 (c 36 20.3) (c 139 49.8) "Oyama"
    , Station 41  1015 (c 36 55.3) (c 139 41.7) "Ikari"
    , Station 41  1018 (c 36 21.8) (c 139 34.2) "Sano"
    , Station 41  1221 (c 36 53.5) (c 139 34.1) "Dorobu"
    , Station 41  1333 (c 36 43.6) (c 139 40.6) "Imaichi"
    , Station 41  1334 (c 36 45.4) (c 139 54.0) "Shioya"
    , Station 41  1605 (c 36 38.5) (c 140 07.0) "Nasukarasuyama"
    , Station 41 47615 (c 36 32.9) (c 139 52.1) "Utsunomiya"
    , Station 41 47690 (c 36 44.3) (c 139 30.0) "Okunikko"

    , Station 42  0343 (c 36 37.0) (c 138 35.5) "Kusatsu"
    , Station 42  0346 (c 36 39.2) (c 139 03.6) "Numata"
    , Station 42  0348 (c 36 27.8) (c 138 27.8) "Tashiro"
    , Station 42  0351 (c 36 23.0) (c 139 20.7) "Kiryu"
    , Station 42  0353 (c 36 22.6) (c 138 53.7) "Kamisatomi"
    , Station 42  0354 (c 36 14.7) (c 138 42.4) "Nishinomaki"
    , Station 42  0356 (c 36 14.0) (c 139 31.9) "Tatebayashi"
    , Station 42  1019 (c 36 48.0) (c 138 59.5) "Minakami"
    , Station 42  1020 (c 36 35.2) (c 138 51.0) "Kakanojou"
    , Station 42  1021 (c 36 19.9) (c 139 09.9) "Isesaki"
    , Station 42  1222 (c 36 51.8) (c 139 03.5) "Fujiwara"
    , Station 42  1223 (c 36 10.2) (c 138 51.8) "Inafukumiyama"
    , Station 42 47624 (c 36 24.3) (c 139 03.6) "Maebashi"

    , Station 43  0359 (c 36 05.2) (c 139 38.1) "Kuki"
    , Station 43  0363 (c 35 52.5) (c 139 35.2) "Saitama"
    , Station 43  0364 (c 35 53.0) (c 139 45.4) "Koshigaya"
    , Station 43  1009 (c 36 06.3) (c 139 11.0) "Yorii"
    , Station 43  1070 (c 35 46.4) (c 139 24.8) "Tokorozawa"
    , Station 43  1232 (c 35 59.1) (c 139 20.1) "Hatoyama"
    , Station 43 47626 (c 36 09.0) (c 139 22.8) "Kumagaya"
    , Station 43 47641 (c 35 59.4) (c 139 04.4) "Chichibu"

    , Station 62  0600 (c 34 56.9) (c 135 27.3) "Nose"
    , Station 62  0602 (c 34 47.0) (c 135 26.2) "Toyonaka"
    , Station 62  0604 (c 34 40.5) (c 135 40.6) "Ikomayama"
    , Station 62  0606 (c 34 23.1) (c 135 21.0) "Kumatori"
    , Station 62  1062 (c 34 33.3) (c 135 29.1) "Sakai"
    , Station 62  1065 (c 34 48.5) (c 135 40.3) "Hirakata"
    , Station 62  1470 (c 34 35.8) (c 135 36.0) "Yao"
    , Station 62  1471 (c 34 26.0) (c 135 13.9) "Kankujima"
    , Station 62 47772 (c 34 40.9) (c 135 31.1) "Osaka"

    , Station 64  0630 (c 34 36.3) (c 135 57.2) "Hari"
    , Station 64  0633 (c 34 29.3) (c 135 55.9) "Oouda"
    , Station 64  0635 (c 34 22.8) (c 135 43.8) "Gojo"
    , Station 64  0957 (c 34 08.2) (c 136 00.3) "Kamikitayama"
    , Station 64  1228 (c 34 02.7) (c 135 47.2) "Kazeya"
    , Station 64 47780 (c 34 41.6) (c 135 49.6) "Nara"

    , Station 65  0645 (c 34 13.3) (c 135 35.4) "Kouyasan"
    , Station 65  0649 (c 33 41.2) (c 135 58.2) "Shingu"
    , Station 65  0971 (c 33 47.5) (c 135 30.8) "Kurisugawa"
    , Station 65  1063 (c 34 05.2) (c 135 25.5) "Shimizu"
    , Station 65  1089 (c 33 56.7) (c 135 33.4) "Ryuujin"
    , Station 65  1342 (c 34 18.6) (c 135 31.7) "Katsuragi"
    , Station 65  1347 (c 33 38.3) (c 135 42.6) "Nishikawa"
    , Station 65  1457 (c 34 16.8) (c 135 00.0) "Tomogashima"
    , Station 65  1485 (c 33 53.6) (c 135 13.0) "Kawabe"
    , Station 65  1589 (c 33 39.7) (c 135 21.8) "Nankishirahama"
    , Station 65 47777 (c 34 13.7) (c 135 09.8) "Wakayama"
    , Station 65 47778 (c 33 27.0) (c 135 45.4) "Shionomisaki"
    ]


c :: Int ->
     Float ->
     Float
c d m = fromIntegral d + m / 60
