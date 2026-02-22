/*var _target_x = mouse_x - (view_w / 2);
var _target_y = mouse_y - (view_h / 2);

var _min_x = global.current_area * area_width;
var _max_x = _min_x + area_width - view_w
var _min_y = 0;
var _max_y = room_height - view_h

_target_x = clamp(_target_x, _min_x, _max_x);
_target_y = clamp(_target_y, _min_y, _max_y);

var _current_cam_x = camera_get_view_x(cam);
var _current_cam_y = camera_get_view_y(cam);

var _new_x = lerp(_current_cam_x, _target_x, .025);
var _new_y = lerp(_current_cam_y, _target_y, .025);

camera_set_view_pos(cam, _new_x, _new_y);