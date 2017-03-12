/// button_to_string( button )
/*//
How to use:
Simply call this script in a draw_text function.
argument0 should be a button such as gp_face1.
//*/

switch( argument0 ) {
    case gp_face1: return "Button 1";
    case gp_face2: return "Button 2";
    case gp_face3: return "Button 3";
    case gp_face4: return "Button 4";
    case gp_shoulderl: return "L Trigger";
    case gp_shoulderlb: return "L Shoulder";
    case gp_shoulderr: return "R Trigger";
    case gp_shoulderrb: return "R Shoulder";
    case gp_select: return "Select";
    case gp_start: return "Start";
    case gp_stickl: return "L Stick";
    case gp_stickr: return "R Stick";
    case gp_padu: return "^";
    case gp_padd: return "\";
    case gp_padl: return "[";
    case gp_padr: return "]";
    default: return noone;
}
