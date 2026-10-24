struct Params { amount: f32 }

fn hash32(p: vec2<u32>) -> f32 {
    var h: u32 = p.x * 1664525u + p.y * 1013904223u;
    h = h ^ (h >> 16u);
    h = h * 2246822519u;
    h = h ^ (h >> 13u);
    return f32(h) / 4294967295.0;
}

/// Sixteen bands of the frame shoved sideways by their own hash and flickered
/// in brightness: the broken-buffer look. Each band is a row of the picture,
/// so the cuts stay horizontal however the frame is scaled.
fn effect(uv: vec2<f32>) -> vec4<f32> {
    let band = u32(floor(uv.y * 16.0));
    let h = hash32(vec2<u32>(band, 7u)) - 0.5;
    let h2 = hash32(vec2<u32>(band, 19u));
    let shift = h * params.amount * 0.0012;
    let c = sample(vec2<f32>(uv.x + shift, uv.y));
    let gain = 0.9 + 0.2 * h2;
    return vec4<f32>(c.rgb * gain, c.a);
}
