struct Params { speed: f32 }

fn eased(x: f32) -> f32 {
    let t = clamp(x, 0.0, 1.0);
    return t * t * (3.0 - 2.0 * t);
}

/// A bright streak sweeps across between the two shots: the incoming one is
/// already there behind the light, and the streak is what carries the eye.
fn transition(uv: vec2<f32>, progress: f32) -> vec4<f32> {
    let p = eased(progress);
    let band = max(params.speed * 0.0016, 0.0008);
    let m = smoothstep(p - 0.03, p + 0.03, uv.x);
    let d = abs(uv.x - p);
    let streak = 1.0 - clamp(d / band, 0.0, 1.0);
    let add = streak * params.speed * 0.006;
    let lit = mix(from_at(uv), to_at(uv), m);
    return vec4<f32>(lit.rgb + vec3<f32>(add), lit.a);
}
