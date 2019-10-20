from collections import namedtuple

# From sr-robot.git/sr/robot/vision.py
MARKER_ARENA, MARKER_ROBOT = 'arena', 'robot'
MARKER_TOKEN = 'token'

MARKER_TOKEN_GOLD, MARKER_TOKEN_SILVER = 'token-gold', 'token-silver'


marker_offsets = {
    MARKER_ARENA: 0,
    MARKER_ROBOT: 28,

    MARKER_TOKEN: 32,
    MARKER_TOKEN_GOLD: 32,
    MARKER_TOKEN_SILVER: 40,
}

marker_sizes = {
    MARKER_ARENA: 0.25 * (10.0/12),
    MARKER_ROBOT: 0.1 * (10.0/12),

    MARKER_TOKEN: 0.2 * (10.0/12),
    MARKER_TOKEN_GOLD: 0.2 * (10.0/12),
    MARKER_TOKEN_SILVER: 0.2 * (10.0/12),

}

# MarkerInfo class
MarkerInfo = namedtuple( "MarkerInfo", "code marker_type offset size" )

def create_marker_info_by_type(marker_type, offset):
    return MarkerInfo(marker_type = marker_type,
                      offset = offset,
                      size = marker_sizes[marker_type],
                      code = marker_offsets[marker_type] + offset)

# Points
# TODO: World Coordinates
PolarCoord = namedtuple("PolarCoord", "length rot_y")
Point = namedtuple("Point", "polar")

# Marker class
MarkerBase = namedtuple( "Marker", "info res centre timestamp" )
class Marker(MarkerBase):
    def __init__(self, *a, **kwd):
        # Aliases
        self.dist = self.centre.polar.length
        self.rot_y = self.centre.polar.rot_y
