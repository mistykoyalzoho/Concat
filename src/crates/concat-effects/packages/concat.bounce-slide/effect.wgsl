struct Params { bounce: f32 }

fn back_out(x: f32, s: f32) -> f32 {
    let t = x - 1.0;
    let s2 = s * 1.70158;
    return 1.0 + t * t * t * (s2 + 1.0) + t * t * s2;
}

/// The incoming shot slides in from the left and overshoots its landing
/// point before settling. `bounce` is how far past it goes - at zero it
/// slides in and stops.
fn transition(uv: vec2<f32>, progress: f32) -> vec4<f32> {
    let soft = 0.01;
    let q = back_out(progress, 0.05 + params.bounce * 0.05);
    let m = 1.0 - smoothstep(q - soft, q + soft, uv.x);
    return mix(from_at(uv), to_at(uv), m);
}
