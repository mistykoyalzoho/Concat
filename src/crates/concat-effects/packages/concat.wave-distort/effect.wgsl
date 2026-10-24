struct Params { amplitude: f32 }

/// Rows pushed sideways on a sine so the frame ripples like heat off a road,
/// with the crest of each ripple catching a little light.
fn effect(uv: vec2<f32>) -> vec4<f32> {
    let ph = uv.y * 18.0 + frame.time * 2.0;
    let s = sin(ph);
    let w = s * params.amplitude * 0.0006;
    let c = sample(vec2<f32>(uv.x + w, uv.y));
    let crest = (0.5 + 0.5 * s) * params.amplitude * 0.0005;
    return vec4<f32>(c.rgb + vec3<f32>(crest), c.a);
}
