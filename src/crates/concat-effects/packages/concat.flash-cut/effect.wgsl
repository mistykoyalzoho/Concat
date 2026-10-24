struct Params { amount: f32 }

// The cut rides a flash of white: the pictures dissolve as usual and a flash
// peaking in the middle of the cut is added on top, in light, so a highlight
// already past white only goes further.
fn transition(uv: vec2<f32>, progress: f32) -> vec4<f32> {
    let base = mix(from_at(uv), to_at(uv), smoothstep(0.0, 1.0, progress));
    let flash = max(sin(progress * 3.14159265358979), 0.0);
    let k = params.amount * 0.01 * flash;
    return vec4<f32>(base.rgb + vec3<f32>(k), base.a);
}
