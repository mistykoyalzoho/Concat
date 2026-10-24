struct Params { softness: f32 }

// The incoming picture opens out of the middle of the outgoing one: a disc
// whose radius is the cut's progress, its edge softened by `softness`. The
// distance is scaled so the corners of the frame sit at 1.
fn transition(uv: vec2<f32>, progress: f32) -> vec4<f32> {
    let s = max(params.softness * 0.01, 0.0001);
    let d = distance(uv, vec2<f32>(0.5)) * 1.41421356;
    let inner = progress * (1.0 + s) - s;
    let m = smoothstep(inner - s, inner + s, d);
    return mix(to_at(uv), from_at(uv), m);
}
