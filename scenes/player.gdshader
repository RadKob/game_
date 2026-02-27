shader_type canvas_item;

void fragment() {
    vec2 uv = UV;
    vec2 center = vec2(0.5, 0.5);

    float radius = 128.0 / 128.0 * 0.5; // promień okręgu 118px w UV
    float border_width = 2.0 / 128.0;   // szerokość borderu 2px

    float dist = distance(uv, center);

    // Wewnętrzny okrąg → avatar
    if (dist <= radius - border_width) {
        COLOR = texture(TEXTURE, UV);
    }
    // Border 2px wokół okręgu
    else if (dist > radius - border_width && dist <= radius) {
        COLOR = vec4(0.663, 0.663, 0.663, 1.0); // #a9a9a9
    }
    // Poza okręgiem → przezroczyste
    else {
        discard;
    }
}