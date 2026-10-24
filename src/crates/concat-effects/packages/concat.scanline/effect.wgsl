struct Params { depth: f32 }

// A cathode tube's dark line on every other row: a triangle wave with a
// two-pixel period down the layer, so the bands sit on the picture rather
// than crawling across a fixed pixel grid.
fn effect(uv: vec2<f32>) -> vec4<f32> {
    let c = sample(uv);
    let phase = fract(uv.y * frame.size.y * 0.5);
    let line = 1.0 - abs(phase * 2.0 - 1.0);
    let k = params.depth * 0.01;
    return vec4<f32>(c.rgb * (1.0 - k * line), c.a);
}
