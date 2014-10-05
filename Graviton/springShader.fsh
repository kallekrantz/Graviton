void main()
{
    vec2 mid = vec2(0.5)-v_tex_coord;
    float angle = atan(mid.y, mid.x);
    float dist = sqrt(dot(mid,mid));
    float time = u_time/3.0;
    float modAngle = 5.0*mod(angle, 0.2)-0.5;
    float innerAngle = abs(cos(modAngle));
    gl_FragColor = vec4(innerAngle*dist);
}