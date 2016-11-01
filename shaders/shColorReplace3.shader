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
//  shColorReplace3
//
//      Replaces three colors with three others. 
//
//      colorIn1             first color to replace (vec4)
//      colorOut1            first replacement color (vec4)
//      colorIn2             second color to replace (vec4)
//      colorOut2            second replacement color (vec4)
//      colorIn3             third color to replace (vec4)
//      colorOut3            third replacement color (vec4)
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec4  colorIn1;
uniform vec4  colorOut1;
uniform vec4  colorIn2;
uniform vec4  colorOut2;
uniform vec4  colorIn3;
uniform vec4  colorOut3;

void main() {
    vec4 colorPixel = texture2D( gm_BaseTexture, v_vTexcoord );
    
    if (length(colorPixel - colorIn1) < 3.0/255.0) {
        gl_FragColor = colorOut1;
    }
    else if (length(colorPixel - colorIn2) < 3.0/255.0) {
        gl_FragColor = colorOut2;
    }
    else if (length(colorPixel - colorIn3) < 3.0/255.0) {
        gl_FragColor = colorOut3;
    }
    else {
        gl_FragColor = colorPixel;
    }
    
}
