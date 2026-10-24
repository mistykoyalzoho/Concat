struct Params { split: f32 }

/// Two halves split on a soft line: the frame above it a touch warmer, the
/// one below a touch cooler, the way a split diopter lays two glasses over
/// one shot.
fn effect(uv: vec2<f32>) -> vec4<f32> {
    let edge = params.split * 0.01;
    let m = smoothstep(edge - 0.03, edge + 0.03, uv.y);
    let top = vec3<f32>(1.02, 1.0, 0.96);
    let bottom = vec3<f32>(0.98, 1.0, 1.04);
    let c = sample(uv);
    return vec4<f32>(c.rgb * mix(top, bottom, m), c.a);
}
