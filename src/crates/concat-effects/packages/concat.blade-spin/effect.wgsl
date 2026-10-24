/// The outgoing shot spins and shrinks about its middle until there is
/// nothing left of it: the incoming shot was behind it the whole time.
fn transition(uv: vec2<f32>, progress: f32) -> vec4<f32> {
    let ang = progress * 1.5707963;
    let k = cos(ang);
    let s = sin(ang);
    let c = uv - vec2<f32>(0.5);
    let q = vec2<f32>(c.x * k + c.y * s, -c.x * s + c.y * k);
    let side = (1.0 - progress) * 0.5;
    let soft = 0.01;
    let inx = smoothstep(side + soft, side - soft, abs(q.x));
    let iny = smoothstep(side + soft, side - soft, abs(q.y));
    return mix(to_at(uv), from_at(uv), inx * iny);
}
