struct Params { amount: f32 }

fn hash32(p: vec2<u32>) -> f32 {
    var h: u32 = p.x * 1664525u + p.y * 1013904223u;
    h = h ^ (h >> 16u);
    h = h * 2246822519u;
    h = h ^ (h >> 13u);
    return f32(h) / 4294967295.0;
}

/// Snow on the picture: every pixel offset by its own hash, so the grain
/// holds still on a still frame and changes with every one after it.
fn effect(uv: vec2<f32>) -> vec4<f32> {
    let px = vec2<u32>(uv * frame.size + vec2<f32>(0.5));
    let n = hash32(px) - 0.5;
    let c = sample(uv);
    return vec4<f32>(c.rgb + vec3<f32>(n * params.amount * 0.005), c.a);
}
