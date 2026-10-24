struct Params { segments: f32 }

const TAU: f32 = 6.28318530718;

/// The picture folded into `segments` mirrored wedges about the middle, the
/// wedges shaded so the seams read. A symmetry, not a blur: a still frame
/// stays as sharp as it went in.
fn effect(uv: vec2<f32>) -> vec4<f32> {
    let p = uv * 2.0 - vec2<f32>(1.0);
    let n = max(params.segments, 3.0);
    let wedge = TAU / n;
    let r = length(p);
    var a = atan2(p.y, p.x);
    a = a - wedge * floor(a / wedge);
    a = abs(a - wedge * 0.5);
    let q = vec2<f32>(cos(a), sin(a)) * r * 0.5 + vec2<f32>(0.5);
    let c = sample(clamp(q, vec2<f32>(0.0), vec2<f32>(1.0)));
    let shade = 0.85 + 0.3 * (a / wedge);
    return vec4<f32>(c.rgb * shade, c.a);
}
