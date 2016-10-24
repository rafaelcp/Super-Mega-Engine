//makeMap(roomid)
roomid = argument0;
oldroom = room;
if oldroom != roomid {
    room_goto(roomid);
}

start_screen[0] = floor(objMegaman.x / view_wview[0]);
start_screen[1] = floor(objMegaman.y / view_hview[0]);
start_screen[2] = 0;    //Depth

max_x = floor((room_width-1)/view_wview[0]);
max_y = floor((room_height-1)/view_hview[0]);

show_debug_message("making map for room " + string(room) + " Start at ("+string(start_screen[0])+","+string(start_screen[1])+")");

q = ds_queue_create();
line_q = ds_queue_create();

ds_queue_enqueue(q, start_screen);

while !ds_queue_empty(q) {
    var r = ds_queue_dequeue(q);
    /*if insideScreen(r[0], r[1], objSectionArrowUp) && r[1] > 0 {
        line[0] = r[0];
        line[1] = r[1];
        line[2] = r[2];
        line[3] = r[0];
        line[4] = r[1] - 1;
        line[5] = r[2] + 1;
        ds_queue_enqueue(line_q, line);
    }*/
    /*if insideScreen(r[0], r[1], objSectionArrowDown) && r[1] < max_y {
        var r_neighbor;
        r_neighbor[0] = r[0];
        r_neighbor[1] = r[1] + 1;
        r_neighbor[2] = r[2] + 1;
        ds_queue_enqueue(q, r_neighbor);
    }*/
    /*if r[0] < max_x && (insideScreen(r[0], r[1], objSectionArrowRight) || (!insideScreen(r[0],r[1], objSectionBorderRightScreen) && !insideScreen(r[0],r[1], objSectionBorderRight))) {
        var r_neighbor;
        r_neighbor[0] = r[0] + 1;
        r_neighbor[1] = r[1];
        r_neighbor[2] = r[2] + 1;
        ds_queue_enqueue(q, r_neighbor);
    }*/
    /*if  r[0] > 0 && (insideScreen(r[0], r[1], objSectionArrowLeft) || (!insideScreen(r[0],r[1], objSectionBorderLeftScreen) && !insideScreen(r[0],r[1], objSectionBorderLeft))) {
        var r_neighbor;
        r_neighbor[0] = r[0] - 1;
        r_neighbor[1] = r[1];
        r_neighbor[2] = r[2] + 1;
        ds_queue_enqueue(q, r_neighbor);
    }*/
    //show_debug_message("from ("+string(prev_r[0])+","+string(prev_r[1])+") to ("+string(r[0])+","+string(r[1])+")");
    line[0] = prev_r[0];
    line[1] = prev_r[1];
    line[2] = prev_r[2];
    line[3] = r[0];
    line[4] = r[1];
    line[5] = r[2];
    ds_queue_enqueue(line_q, line);
    prev_r[0] = r[0];
    prev_r[1] = r[1];
    prev_r[2] = r[2];
}

ds_queue_destroy(q);

if oldroom != roomid {
    room_goto(oldroom);
}

show_debug_message(line_q);
return line_q;
