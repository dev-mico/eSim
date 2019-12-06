x = target.x;
y = target.y;
var cam_id = view_camera[0]

camera_set_view_size(view_camera[0], orig_x_size * zoom, orig_y_size * zoom);
var cam_width = camera_get_view_width(cam_id);
var cam_height = camera_get_view_height(cam_id);
camera_set_view_pos(cam_id, x - cam_width *.5, y-cam_height* .5);
zoom += (target_zoom - zoom) * (minimum_zoom/100*2);

var mouse_input = mouse_wheel_down() - mouse_wheel_up();
target_zoom += mouse_input/16;

target_zoom = clamp(target_zoom, minimum_zoom/100, (room_width * (1/(orig_x_size))));

if (following != pointer_null) {
	x = following.x;
	y = following.y;
}

x = clamp(x, camera_get_view_width(cam_id)/2, room_width - camera_get_view_width(cam_id) * .5);
y = clamp(y, camera_get_view_height(cam_id)/2, room_height - camera_get_view_height(cam_id) * .5);



