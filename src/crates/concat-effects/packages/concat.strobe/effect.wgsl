struct Params { strength: f32 }

/// A hard flash four times a second, sharpest at the top of each beat and
/// gone by the next: the room's light on the kick drum.
fn effect(uv: vec2<f32>) -> vec4<f32> {
    let phase = fract(frame.time * 4.0);
    let flash = pow(1.0 - phase, 8.0);
    let c = sample(uv);
    let k = flash * params.strength * 0.01;
    return vec4<f32>(c.rgb + vec3<f32>(k), c.a);
}
