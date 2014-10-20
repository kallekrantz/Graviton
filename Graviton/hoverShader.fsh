void main(){
    float time = u_time*3.0;
    gl_FragColor = abs(cos(time)) * SKDefaultShading();
}