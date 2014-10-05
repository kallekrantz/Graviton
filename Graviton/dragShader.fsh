void main()
{
    vec2 mid = vec2(0.5)-v_tex_coord;
    float dist = sqrt(dot(mid,mid));
    float time = u_time/5.0;
    gl_FragColor = vec4(1.0-dist);
}