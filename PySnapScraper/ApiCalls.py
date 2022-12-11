#!/usr/bin/env python3

import console
import requests
import json
from typing import Optional, Any, List, TypeVar, Callable, Type, cast
from datetime import datetime
from enum import Enum
from math import exp
import decimal

class SCApiCalls:
	def getEpoch(latitude, longitude, zoom):
#---------------------------------START QUICKTYPE CODE-----------------------------#
		T = TypeVar("T")


		def from_float(x: Any) -> float:
		    assert isinstance(x, (float, int)) and not isinstance(x, bool)
		    return float(x)


		def from_none(x: Any) -> Any:
		    assert x is None
		    return x


		def from_union(fs, x):
		    for f in fs:
		        try:
		            return f(x)
		        except:
		            pass
		    assert False


		def to_float(x: Any) -> float:
		    assert isinstance(x, float)
		    return x


		def from_list(f: Callable[[Any], T], x: Any) -> List[T]:
		    assert isinstance(x, list)
		    return [f(y) for y in x]


		def to_class(c: Type[T], x: Any) -> dict:
		    assert isinstance(x, c)
		    return cast(Any, x).to_dict()


		def from_int(x: Any) -> int:
		    assert isinstance(x, int) and not isinstance(x, bool)
		    return x


		def from_str(x: Any) -> str:
		    assert isinstance(x, str)
		    return x

		class Color:
		    red: Optional[float]
		    green: Optional[float]
		    blue: Optional[float]
		    alpha: Optional[float]

		    def __init__(self, red: Optional[float], green: Optional[float], blue: Optional[float], alpha: Optional[float]) -> None:
		        self.red = red
		        self.green = green
		        self.blue = blue
		        self.alpha = alpha

		    @staticmethod
		    def from_dict(obj: Any) -> 'Color':
		        assert isinstance(obj, dict)
		        red = from_union([from_float, from_none], obj.get("red"))
		        green = from_union([from_float, from_none], obj.get("green"))
		        blue = from_union([from_float, from_none], obj.get("blue"))
		        alpha = from_union([from_float, from_none], obj.get("alpha"))
		        return Color(red, green, blue, alpha)

		    def to_dict(self) -> dict:
		        result: dict = {}
		        result["red"] = from_union([to_float, from_none], self.red)
		        result["green"] = from_union([to_float, from_none], self.green)
		        result["blue"] = from_union([to_float, from_none], self.blue)
		        result["alpha"] = from_union([to_float, from_none], self.alpha)
		        return result


		class HeatmapGradient:
		    colors: List[Color]
		    transition_locations: List[float]

		    def __init__(self, colors: List[Color], transition_locations: List[float]) -> None:
		        self.colors = colors
		        self.transition_locations = transition_locations

		    @staticmethod
		    def from_dict(obj: Any) -> 'HeatmapGradient':
		        assert isinstance(obj, dict)
		        colors = from_list(Color.from_dict, obj.get("colors"))
		        transition_locations = from_list(from_float, obj.get("transitionLocations"))
		        return HeatmapGradient(colors, transition_locations)

		    def to_dict(self) -> dict:
		        result: dict = {}
		        result["colors"] = from_list(lambda x: to_class(Color, x), self.colors)
		        result["transitionLocations"] = from_list(to_float, self.transition_locations)
		        return result


		class RenderConfig:
		    heatmap_gradient: HeatmapGradient
		    heat_normalization_peak: int
		    fuzz_normalization_peak: float
		    heat_point_base_radius: int

		    def __init__(self, heatmap_gradient: HeatmapGradient, heat_normalization_peak: int, fuzz_normalization_peak: float, heat_point_base_radius: int) -> None:
		        self.heatmap_gradient = heatmap_gradient
		        self.heat_normalization_peak = heat_normalization_peak
		        self.fuzz_normalization_peak = fuzz_normalization_peak
		        self.heat_point_base_radius = heat_point_base_radius

		    @staticmethod
		    def from_dict(obj: Any) -> 'RenderConfig':
		        assert isinstance(obj, dict)
		        heatmap_gradient = HeatmapGradient.from_dict(obj.get("heatmapGradient"))
		        heat_normalization_peak = from_int(obj.get("heatNormalizationPeak"))
		        fuzz_normalization_peak = from_float(obj.get("fuzzNormalizationPeak"))
		        heat_point_base_radius = from_int(obj.get("heatPointBaseRadius"))
		        return RenderConfig(heatmap_gradient, heat_normalization_peak, fuzz_normalization_peak, heat_point_base_radius)

		    def to_dict(self) -> dict:
		        result: dict = {}
		        result["heatmapGradient"] = to_class(HeatmapGradient, self.heatmap_gradient)
		        result["heatNormalizationPeak"] = from_int(self.heat_normalization_peak)
		        result["fuzzNormalizationPeak"] = to_float(self.fuzz_normalization_peak)
		        result["heatPointBaseRadius"] = from_int(self.heat_point_base_radius)
		        return result


		class HeatTileSetInfo:
		    heat_from_time: int
		    heat_to_time: int
		    total_heatmap_points: int
		    heatmap_gradient: HeatmapGradient
		    heat_normalization_peak: int
		    fuzz_normalization_peak: float
		    heat_point_base_radius: int

		    def __init__(self, heat_from_time: int, heat_to_time: int, total_heatmap_points: int, heatmap_gradient: HeatmapGradient, heat_normalization_peak: int, fuzz_normalization_peak: float, heat_point_base_radius: int) -> None:
		        self.heat_from_time = heat_from_time
		        self.heat_to_time = heat_to_time
		        self.total_heatmap_points = total_heatmap_points
		        self.heatmap_gradient = heatmap_gradient
		        self.heat_normalization_peak = heat_normalization_peak
		        self.fuzz_normalization_peak = fuzz_normalization_peak
		        self.heat_point_base_radius = heat_point_base_radius

		    @staticmethod
		    def from_dict(obj: Any) -> 'HeatTileSetInfo':
		        assert isinstance(obj, dict)
		        heat_from_time = from_int(obj.get("heatFromTime"))
		        heat_to_time = from_int(obj.get("heatToTime"))
		        total_heatmap_points = from_int(obj.get("totalHeatmapPoints"))
		        heatmap_gradient = HeatmapGradient.from_dict(obj.get("heatmapGradient"))
		        heat_normalization_peak = from_int(obj.get("heatNormalizationPeak"))
		        fuzz_normalization_peak = from_float(obj.get("fuzzNormalizationPeak"))
		        heat_point_base_radius = from_int(obj.get("heatPointBaseRadius"))
		        return HeatTileSetInfo(heat_from_time, heat_to_time, total_heatmap_points, heatmap_gradient, heat_normalization_peak, fuzz_normalization_peak, heat_point_base_radius)

		    def to_dict(self) -> dict:
		        result: dict = {}
		        result["heatFromTime"] = from_int(self.heat_from_time)
		        result["heatToTime"] = from_int(self.heat_to_time)
		        result["totalHeatmapPoints"] = from_int(self.total_heatmap_points)
		        result["heatmapGradient"] = to_class(HeatmapGradient, self.heatmap_gradient)
		        result["heatNormalizationPeak"] = from_int(self.heat_normalization_peak)
		        result["fuzzNormalizationPeak"] = to_float(self.fuzz_normalization_peak)
		        result["heatPointBaseRadius"] = from_int(self.heat_point_base_radius)
		        return result


		class ID:
		    type: str
		    flavor: str
		    epoch: str

		    def __init__(self, type: str, flavor: str, epoch: str) -> None:
		        self.type = type
		        self.flavor = flavor
		        self.epoch = epoch

		    @staticmethod
		    def from_dict(obj: Any) -> 'ID':
		        assert isinstance(obj, dict)
		        type = from_str(obj.get("type"))
		        flavor = from_str(obj.get("flavor"))
		        epoch = from_str(obj.get("epoch"))
		        return ID(type, flavor, epoch)

		    def to_dict(self) -> dict:
		        result: dict = {}
		        result["type"] = from_str(self.type)
		        result["flavor"] = from_str(self.flavor)
		        result["epoch"] = from_str(self.epoch)
		        return result


		class PoiSizeEquation:
		    order: List[int]
		    stretch: List[float]
		    coefficient: List[int]
		    intercept: int

		    def __init__(self, order: List[int], stretch: List[float], coefficient: List[int], intercept: int) -> None:
		        self.order = order
		        self.stretch = stretch
		        self.coefficient = coefficient
		        self.intercept = intercept

		    @staticmethod
		    def from_dict(obj: Any) -> 'PoiSizeEquation':
		        assert isinstance(obj, dict)
		        order = from_list(from_int, obj.get("order"))
		        stretch = from_list(from_float, obj.get("stretch"))
		        coefficient = from_list(from_int, obj.get("coefficient"))
		        intercept = from_int(obj.get("intercept"))
		        return PoiSizeEquation(order, stretch, coefficient, intercept)

		    def to_dict(self) -> dict:
		        result: dict = {}
		        result["order"] = from_list(from_int, self.order)
		        result["stretch"] = from_list(to_float, self.stretch)
		        result["coefficient"] = from_list(from_int, self.coefficient)
		        result["intercept"] = from_int(self.intercept)
		        return result


		class PoiTileSetInfo:
		    poi_size_equation: PoiSizeEquation

		    def __init__(self, poi_size_equation: PoiSizeEquation) -> None:
		        self.poi_size_equation = poi_size_equation

		    @staticmethod
		    def from_dict(obj: Any) -> 'PoiTileSetInfo':
		        assert isinstance(obj, dict)
		        poi_size_equation = PoiSizeEquation.from_dict(obj.get("poiSizeEquation"))
		        return PoiTileSetInfo(poi_size_equation)

		    def to_dict(self) -> dict:
		        result: dict = {}
		        result["poiSizeEquation"] = to_class(PoiSizeEquation, self.poi_size_equation)
		        return result


		class TileSetInfo:
		    id: ID
		    state: str
		    start_time: int
		    last_update_time: int
		    poi_tile_set_info: Optional[PoiTileSetInfo]
		    heat_tile_set_info: Optional[HeatTileSetInfo]

		    def __init__(self, id: ID, state: str, start_time: int, last_update_time: int, poi_tile_set_info: Optional[PoiTileSetInfo], heat_tile_set_info: Optional[HeatTileSetInfo]) -> None:
		        self.id = id
		        self.state = state
		        self.start_time = start_time
		        self.last_update_time = last_update_time
		        self.poi_tile_set_info = poi_tile_set_info
		        self.heat_tile_set_info = heat_tile_set_info

		    @staticmethod
		    def from_dict(obj: Any) -> 'TileSetInfo':
		        assert isinstance(obj, dict)
		        id = ID.from_dict(obj.get("id"))
		        state = from_str(obj.get("state"))
		        start_time = from_int(obj.get("startTime"))
		        last_update_time = from_int(obj.get("lastUpdateTime"))
		        poi_tile_set_info = from_union([PoiTileSetInfo.from_dict, from_none], obj.get("poiTileSetInfo"))
		        heat_tile_set_info = from_union([HeatTileSetInfo.from_dict, from_none], obj.get("heatTileSetInfo"))
		        return TileSetInfo(id, state, start_time, last_update_time, poi_tile_set_info, heat_tile_set_info)

		    def to_dict(self) -> dict:
		        result: dict = {}
		        result["id"] = to_class(ID, self.id)
		        result["state"] = from_str(self.state)
		        result["startTime"] = from_int(self.start_time)
		        result["lastUpdateTime"] = from_int(self.last_update_time)
		        result["poiTileSetInfo"] = from_union([lambda x: to_class(PoiTileSetInfo, x), from_none], self.poi_tile_set_info)
		        result["heatTileSetInfo"] = from_union([lambda x: to_class(HeatTileSetInfo, x), from_none], self.heat_tile_set_info)
		        return result


		class Welcome:
		    render_config: RenderConfig
		    tile_set_infos: List[TileSetInfo]
		    lifetime_sec: int

		    def __init__(self, render_config: RenderConfig, tile_set_infos: List[TileSetInfo], lifetime_sec: int) -> None:
		        self.render_config = render_config
		        self.tile_set_infos = tile_set_infos
		        self.lifetime_sec = lifetime_sec

		    @staticmethod
		    def from_dict(obj: Any) -> 'Welcome':
		        assert isinstance(obj, dict)
		        render_config = RenderConfig.from_dict(obj.get("renderConfig"))
		        tile_set_infos = from_list(TileSetInfo.from_dict, obj.get("tileSetInfos"))
		        lifetime_sec = from_int(obj.get("lifetimeSec"))
		        return Welcome(render_config, tile_set_infos, lifetime_sec)

		    def to_dict(self) -> dict:
		        result: dict = {}
		        result["renderConfig"] = to_class(RenderConfig, self.render_config)
		        result["tileSetInfos"] = from_list(lambda x: to_class(TileSetInfo, x), self.tile_set_infos)
		        result["lifetimeSec"] = from_int(self.lifetime_sec)
		        return result


		def welcome_from_dict(s: Any) -> Welcome:
		    return Welcome.from_dict(s)


		def welcome_to_dict(x: Welcome) -> Any:
		    return to_class(Welcome, x)

#----------------------------------END QUICKTYPE CODE-----------------------------#

#----------------------------------START POSTMAN CANARY CODE-----------------------------#
		url = "https://ms.sc-jpl.com/web/getLatestTileSet"

		payload = json.dumps({})
		headers = {
		  'Content-Type': 'application/json'
		}

		response = requests.request("POST", url, headers=headers, data=payload)

		#print(response.text)
#----------------------------------END POSTMAN CANARY CODE-----------------------------#
		JSON_tileSet = json.loads(response.text)

		if "epoch" in JSON_tileSet['tileSetInfos'][0]["id"]:
			epoch = JSON_tileSet['tileSetInfos'][0]["id"]["epoch"]
		else:
			print("Error! No Epoch Found")

		return epoch


	def getPlaylist(latitude, longitude, zoom, epoch, flag):
		#epoch = SCApiCalls.getEpoch(longitude, latitude, zoom)
#----------------------------------START QUICKTYPE CODE-----------------------------#

		T = TypeVar("T")
		EnumT = TypeVar("EnumT", bound=Enum)


		def from_str(x: Any) -> str:
		    assert isinstance(x, str)
		    return x


		def from_none(x: Any) -> Any:
		    assert x is None
		    return x


		def from_union(fs, x):
		    for f in fs:
		        try:
		            return f(x)
		        except:
		            pass
		    assert False


		def to_enum(c: Type[EnumT], x: Any) -> EnumT:
		    assert isinstance(x, c)
		    return x.value


		def from_list(f: Callable[[Any], T], x: Any) -> List[T]:
		    assert isinstance(x, list)
		    return [f(y) for y in x]


		def to_class(c: Type[T], x: Any) -> dict:
		    assert isinstance(x, c)
		    return cast(Any, x).to_dict()


		def from_float(x: Any) -> float:
		    assert isinstance(x, (float, int)) and not isinstance(x, bool)
		    return float(x)


		def to_float(x: Any) -> float:
		    assert isinstance(x, float)
		    return x


		class StreamingMediaInfo:
		    prefix_url: str
		    preview_url: str
		    media_url: str
		    overlay_url: Optional[str]
		    preview_with_overlay_url: Optional[str]

		    def __init__(self, prefix_url: str, preview_url: str, media_url: str, overlay_url: Optional[str], preview_with_overlay_url: Optional[str]) -> None:
		        self.prefix_url = prefix_url
		        self.preview_url = preview_url
		        self.media_url = media_url
		        self.overlay_url = overlay_url
		        self.preview_with_overlay_url = preview_with_overlay_url

		    @staticmethod
		    def from_dict(obj: Any) -> 'StreamingMediaInfo':
		        assert isinstance(obj, dict)
		        prefix_url = from_str(obj.get("prefixUrl"))
		        preview_url = from_str(obj.get("previewUrl"))
		        media_url = from_str(obj.get("mediaUrl"))
		        overlay_url = from_union([from_str, from_none], obj.get("overlayUrl"))
		        preview_with_overlay_url = from_union([from_str, from_none], obj.get("previewWithOverlayUrl"))
		        return StreamingMediaInfo(prefix_url, preview_url, media_url, overlay_url, preview_with_overlay_url)

		    def to_dict(self) -> dict:
		        result: dict = {}
		        result["prefixUrl"] = from_str(self.prefix_url)
		        result["previewUrl"] = from_str(self.preview_url)
		        result["mediaUrl"] = from_str(self.media_url)
		        result["overlayUrl"] = from_union([from_str, from_none], self.overlay_url)
		        result["previewWithOverlayUrl"] = from_union([from_str, from_none], self.preview_with_overlay_url)
		        return result


		class ThumbnailType(Enum):
		    IMAGE_THUMBNAIL_TYPE = "IMAGE_THUMBNAIL_TYPE"
		    VIDEO_THUMBNAIL_TYPE = "VIDEO_THUMBNAIL_TYPE"


		class Info:
		    thumbnail_type: ThumbnailType
		    thumbnail_url: str

		    def __init__(self, thumbnail_type: ThumbnailType, thumbnail_url: str) -> None:
		        self.thumbnail_type = thumbnail_type
		        self.thumbnail_url = thumbnail_url

		    @staticmethod
		    def from_dict(obj: Any) -> 'Info':
		        assert isinstance(obj, dict)
		        thumbnail_type = ThumbnailType(obj.get("thumbnailType"))
		        thumbnail_url = from_str(obj.get("thumbnailUrl"))
		        return Info(thumbnail_type, thumbnail_url)

		    def to_dict(self) -> dict:
		        result: dict = {}
		        result["thumbnailType"] = to_enum(ThumbnailType, self.thumbnail_type)
		        result["thumbnailUrl"] = from_str(self.thumbnail_url)
		        return result


		class StreamingThumbnailInfo:
		    infos: List[Info]

		    def __init__(self, infos: List[Info]) -> None:
		        self.infos = infos

		    @staticmethod
		    def from_dict(obj: Any) -> 'StreamingThumbnailInfo':
		        assert isinstance(obj, dict)
		        infos = from_list(Info.from_dict, obj.get("infos"))
		        return StreamingThumbnailInfo(infos)

		    def to_dict(self) -> dict:
		        result: dict = {}
		        result["infos"] = from_list(lambda x: to_class(Info, x), self.infos)
		        return result


		class Fallback(Enum):
		    ADELAIDA_AUSTRALIA_MERIDIONAL = "Adelaida, Australia Meridional"
		    ADELAIDE_AUSTRÁLIA_MERIDIONAL = "Adelaide, Austrália Meridional"
		    ADELAIDE_SOUTH_AUSTRALIA = "Adelaide, South Australia"
		    ADÉLAÏDE_AUSTRALIE_MÉRIDIONALE = "Adélaïde, Australie-Méridionale"
		    АДЕЛАИДА_ЮЖНАЯ_АВСТРАЛИЯ = "Аделаида, Южная Австралия"
		    أديليدجنوبأستراليا = "أديليد, جنوب أستراليا"
		    アデレード南オーストラリア州 = "アデレード, 南オーストラリア州"
		    阿德莱德南澳大利亚州 = "阿德莱德, 南澳大利亚州"
		    아델라이드사우스오스트레일리아주 = "아델라이드, 사우스오스트레일리아 주"


		class String:
		    locale: str
		    text: Fallback

		    def __init__(self, locale: str, text: Fallback) -> None:
		        self.locale = locale
		        self.text = text

		    @staticmethod
		    def from_dict(obj: Any) -> 'String':
		        assert isinstance(obj, dict)
		        locale = from_str(obj.get("locale"))
		        text = Fallback(obj.get("text"))
		        return String(locale, text)

		    def to_dict(self) -> dict:
		        result: dict = {}
		        result["locale"] = from_str(self.locale)
		        result["text"] = to_enum(Fallback, self.text)
		        return result


		class Title:
		    strings: List[String]
		    fallback: Fallback

		    def __init__(self, strings: List[String], fallback: Fallback) -> None:
		        self.strings = strings
		        self.fallback = fallback

		    @staticmethod
		    def from_dict(obj: Any) -> 'Title':
		        assert isinstance(obj, dict)
		        strings = from_list(String.from_dict, obj.get("strings"))
		        fallback = Fallback(obj.get("fallback"))
		        return Title(strings, fallback)

		    def to_dict(self) -> dict:
		        result: dict = {}
		        result["strings"] = from_list(lambda x: to_class(String, x), self.strings)
		        result["fallback"] = to_enum(Fallback, self.fallback)
		        return result


		class SnapInfo:
		    snap_media_type: str
		    title: Title
		    streaming_media_info: StreamingMediaInfo
		    streaming_thumbnail_info: StreamingThumbnailInfo

		    def __init__(self, snap_media_type: str, title: Title, streaming_media_info: StreamingMediaInfo, streaming_thumbnail_info: StreamingThumbnailInfo) -> None:
		        self.snap_media_type = snap_media_type
		        self.title = title
		        self.streaming_media_info = streaming_media_info
		        self.streaming_thumbnail_info = streaming_thumbnail_info

		    @staticmethod
		    def from_dict(obj: Any) -> 'SnapInfo':
		        assert isinstance(obj, dict)
		        snap_media_type = from_str(obj.get("snapMediaType"))
		        title = Title.from_dict(obj.get("title"))
		        streaming_media_info = StreamingMediaInfo.from_dict(obj.get("streamingMediaInfo"))
		        streaming_thumbnail_info = StreamingThumbnailInfo.from_dict(obj.get("streamingThumbnailInfo"))
		        return SnapInfo(snap_media_type, title, streaming_media_info, streaming_thumbnail_info)

		    def to_dict(self) -> dict:
		        result: dict = {}
		        result["snapMediaType"] = from_str(self.snap_media_type)
		        result["title"] = to_class(Title, self.title)
		        result["streamingMediaInfo"] = to_class(StreamingMediaInfo, self.streaming_media_info)
		        result["streamingThumbnailInfo"] = to_class(StreamingThumbnailInfo, self.streaming_thumbnail_info)
		        return result


		class Element:
		    id: str
		    duration: float
		    timestamp: str
		    snap_info: SnapInfo

		    def __init__(self, id: str, duration: float, timestamp: str, snap_info: SnapInfo) -> None:
		        self.id = id
		        self.duration = duration
		        self.timestamp = timestamp
		        self.snap_info = snap_info

		    @staticmethod
		    def from_dict(obj: Any) -> 'Element':
		        assert isinstance(obj, dict)
		        id = from_str(obj.get("id"))
		        duration = from_float(obj.get("duration"))
		        timestamp = from_str(obj.get("timestamp"))
		        snap_info = SnapInfo.from_dict(obj.get("snapInfo"))
		        return Element(id, duration, timestamp, snap_info)

		    def to_dict(self) -> dict:
		        result: dict = {}
		        result["id"] = from_str(self.id)
		        result["duration"] = to_float(self.duration)
		        result["timestamp"] = from_str(self.timestamp)
		        result["snapInfo"] = to_class(SnapInfo, self.snap_info)
		        return result


		class Manifest:
		    elements: List[Element]

		    def __init__(self, elements: List[Element]) -> None:
		        self.elements = elements

		    @staticmethod
		    def from_dict(obj: Any) -> 'Manifest':
		        assert isinstance(obj, dict)
		        elements = from_list(Element.from_dict, obj.get("elements"))
		        return Manifest(elements)

		    def to_dict(self) -> dict:
		        result: dict = {}
		        result["elements"] = from_list(lambda x: to_class(Element, x), self.elements)
		        return result


		class Welcome:
		    manifest: Manifest

		    def __init__(self, manifest: Manifest) -> None:
		        self.manifest = manifest

		    @staticmethod
		    def from_dict(obj: Any) -> 'Welcome':
		        assert isinstance(obj, dict)
		        manifest = Manifest.from_dict(obj.get("manifest"))
		        return Welcome(manifest)

		    def to_dict(self) -> dict:
		        result: dict = {}
		        result["manifest"] = to_class(Manifest, self.manifest)
		        return result


		def welcome_from_dict(s: Any) -> Welcome:
		    return Welcome.from_dict(s)


		def welcome_to_dict(x: Welcome) -> Any:
		    return to_class(Welcome, x)

#----------------------------------END QUICKTYPE CODE-----------------------------#
		#parameters

		if latitude != None:
		    if longitude != None:
		        #zoomer = zoom
		        radius = 2E+06*exp(-0.626*float(zoom))
		        parameters = ("requestGeoPoint: {latitude: ", latitude, "longitude: ", longitude, "zoom: ", zoom, "epoch: ", epoch, "radiusMeters: ", radius)
		else:
			parameters = ("requestGeoPoint: {latitude: -34.922452, longitude: 138.604298, zoom: 6.5, epoch: 1589175424000, radiusMeters: 12583.83852123980")


#----------------------------------START POSTMAN CANARY CODE-----------------------------#
		url = "https://ms.sc-jpl.com/web/getPlaylist"

		payload = json.dumps({
		  "requestGeoPoint": {
		    "lat": latitude,
		    "lon": longitude
		  },
		  "zoomLevel": zoom,
		  "tileSetId": {
		    "flavor": "default",
		    "epoch": epoch,
		    "type": 1
		  },
		  "radiusMeters": 81.54645874805576,
		  "maximumFuzzRadius": 0
		})
		headers = {
		  'Content-Type': 'application/json'
		}

		response = requests.request("POST", url, headers=headers, data=payload)

		print(response)

		#print(response.text)
#----------------------------------END POSTMAN CANARY CODE-----------------------------#
		JSON_playlist = json.loads(response.text)

		numberOfSnaps = len(JSON_playlist["manifest"]["elements"])

		mediaUrls = []
		metadata = []

		if flag == True:
			print("")
			print("There are", numberOfSnaps, "snaps in the region selected.")
			print("")

			snapContents = JSON_playlist["manifest"]["elements"]
			print("")
			print("Beginning Print of Snap INFO for Log: ")
			print("")

			count = 0

			while count < numberOfSnaps:
				print("Snap number: ", count)
				if snapContents[count]["snapInfo"]["streamingMediaInfo"] == {}:
					mediaList = snapContents[count]["snapInfo"]["publicMediaInfo"]["publicImageMediaInfo"]["mediaUrl"]
					print("URL:", mediaList)
					mediaUrls.append(mediaList)
					

					mediaTime = snapContents[count]["timestamp"]
					print("Time Stamp: ", mediaTime)
					if mediaTime != 0:
						humanTime = datetime.fromtimestamp(int(mediaTime)/1000)
						print("Human Time: ", humanTime)
						metadata.append(mediaTime)
					else:
						metadata.append("0")

					duration = snapContents[count]["duration"]
					print("Snap Duration:", duration, "seconds")


					mediaID = snapContents[count]["id"]
					print("Snap ID:", mediaID)

					#ASK RICHARD
					# if snapContents[count]["snapInfo"]["overlayText"]:
					# 	print("OverlayText:", snapContents[count]["snapInfo"]["overlayText"])

					# snapMediaType = snapContents[count]["snapInfo"]["snapMediaType"]
					# if snapMediaType:
					# 	print("Snap Media Type:", snapMediaType)
					# else:
					print("Snap Media Type: Image Only")


					location = snapContents[count]["snapInfo"]["title"]["fallback"]
					print("Location:", location)

					print("")
					print("***************************************")
					print("")


					count=count+1
				else:
					mediaList = snapContents[count]["snapInfo"]["streamingMediaInfo"]["prefixUrl"]
					if mediaList:
						print("URL:", mediaList + "media.mp4")
						mediaUrls.append(mediaList + "media.mp4")


						mediaTime = snapContents[count]["timestamp"]
						print(mediaTime)
						if mediaTime != 0:
							humanTime = datetime.fromtimestamp(int(mediaTime)/1000)
							print(humanTime)
							metadata.append(mediaTime)
						else:
							metadata.append("0")


						duration = snapContents[count]["duration"]
						print("Snap Duration:", duration, "seconds")


						mediaID = snapContents[count]["id"]
						print("Snap ID:", mediaID)

						#ASK RICHARD
						# if snapContents[count]["snapInfo"]["overlayText"]:
						# 	print("OverlayText:", snapContents[count]["snapInfo"]["overlayText"])

						snapMediaType = snapContents[count]["snapInfo"]["snapMediaType"]
						if snapMediaType:
							print("Snap Media Type:", snapMediaType)
						else:
							print("Snap Media Type: Image Only")


						location = snapContents[count]["snapInfo"]["title"]["fallback"]
						print("Location:", location)

						print("")
						print("***************************************")
						print("")

					count=count+1
		else:
			print("There are no snaps in that region able to be downloaded at this time.")
			print("")
			print("This could be an error in clock synchronisation with the server. Please run 3x to be sure.")
			print("")
			print("***************************************")
			print("")
					
		
		mediaDict = dict(zip(mediaUrls, metadata))
		# print(mediaUrls)
		# print("-----------------------------")
		# print(mediaDict)

		return (mediaUrls, mediaDict)

		#numberOfSnaps = JSON_struct["tileSetInfos"][1]["id"]["epoch"]


# epoch = SCApiCalls.getEpoch(-34.92213325074112, 138.60354497409344, 14.155615560199017)
# print(epoch)
# print(SCApiCalls.getPlaylist(-34.92213325074112, 138.60354497409344, 14.155615560199017, epoch, True))


#https://linuxhint.com/search_json_python/
#https://snapcraft.io/docs/snap-epochs