struct Params { focus: f32 }

/// A band across the middle kept sharp over a blurred frame: the miniature
/// look. `focus` is the band's height as a share of the frame, and the
/// blurred zone lifts a little, as a tilt lens' out-of-focus air does.
fn effect(uv: vec2<f32>) -> vec4<f32> {
    let h = max(params.focus, 1.0) * 0.005;
    let d = abs(uv.y - 0.5);
    let band = clamp(1.0 - d / h, 0.0, 1.0);
    var blur = vec4<f32>(0.0, 0.0, 0.0, 0.0);
    let t = texel();
    for (var i: i32 = -2; i <= 2; i = i + 1) {
        blur = blur + sample(vec2<f32>(uv.x, uv.y + f32(i) * t.y * 1.5));
    }
    blur = blur * 0.2;
    let c = sample(uv);
    return vec4<f32>(mix(blur.rgb, c.rgb, band) + (1.0 - band) * 0.06, c.a);
}
