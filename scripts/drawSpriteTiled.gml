///drawSpriteTiled(tile width, tile height, top sprite tile, middle sprite tile, bottom sprite tile)
//THIS SCRIPT ALLOWS AN OBJECT, WHEN SCALED VIA IMAGE_XSCALE/IMAGE_YSCALE
//TO TILE ITSELF, RATHER THAN JUST STRETCHING OUT.
//USE IN THE DRAW EVENT

//argument0 = tile spacing X
//argument1 = tile spacing Y
//argument2 = top layer sprite tiles
//argument3 = mid layer sprite tiles
//argument4 = bottom layer sprite tiles
//DRAW THE START SPOT TILE
draw_sprite_ext(argument2,-1,x,y,1,1,0,image_blend,image_alpha)

var i, j;
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//DRAW THE X ROW TILES (AND ALL Y TILES BUT THE FIRST ROW)
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
if image_xscale > 1
    for (i = 1; i < image_xscale; i += 1)
    {
        //Make sure only on screen tiles are drawn.
        
        //
        {
            draw_sprite_ext(argument2,-1,x+(argument0*i),y,1,1,0,image_blend,image_alpha)
            // DRAW ALL Y ROW TILES EXCEPT THE FIRST
            ////////////////////////////////////////
            if image_yscale > 1
                for (j = 1; j < image_yscale; j += 1)
                {
                    //Make sure only on screen tiles are drawn.
                    if y+(argument1*j) > view_yview[0] - argument1 and y+(argument1*j) < view_yview + 240 + argument1
                    //
                    {
                        if j = image_yscale - 1
                            draw_sprite_ext(argument4,-1,x+(argument0*i),y+(argument1*j),1,1,0,image_blend,image_alpha)
                        else
                            draw_sprite_ext(argument3,-1,x+(argument0*i),y+(argument1*j),1,1,0,image_blend,image_alpha)
                    }
                }
        ////////////////////////////////////////
        }
    }
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// DRAW THE 1ST ROW Y TILES
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
if image_yscale > 1
    for (i = 1; i < image_yscale; i += 1)
    {
        //Make sure only on screen tiles are drawn.
        //
        {
            if i = image_yscale - 1
                draw_sprite_ext(argument4,-1,x,y+(argument1*i),1,1,0,image_blend,image_alpha)
            else
                draw_sprite_ext(argument3,-1,x,y+(argument1*i),1,1,0,image_blend,image_alpha)
        }
    }
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
