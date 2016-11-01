//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.	
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{

    vec3 colors[4];
    //#0F380F #306230 #8BAC0F #9BBC0F
    colors[0] = vec3(0x0F, 0x38, 0x0F) / 255.0;
    colors[1] = vec3(0x30, 0x62, 0x30) / 255.0;
    colors[2] = vec3(0x8B, 0xAC, 0x0F) / 255.0;
    colors[3] = vec3(0x9B, 0xBC, 0x0F) / 255.0;

    vec4 c = texture2D( gm_BaseTexture, v_vTexcoord );

    float gray = 0.21 * c.r + 0.72 * c.g + 0.07 * c.b;
    gray = min(0.999, floor(gray * 3.0 + 0.5) / 3.0);
    int i = int(floor(gray * 4.0));
    vec3 col;
    for (int x = 0; x < 4; x++) {  //workaround for webgl, array index must be constant
        if (i == x) { 
            col = colors[x];
        }
    }
    //vec3 col = colors[i]; 
    gl_FragColor = vec4(col, c.a);
}

