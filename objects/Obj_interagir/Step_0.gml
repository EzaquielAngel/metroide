/// Step Event
if (instance_exists(Prota_Obj)) {
    var d = point_distance(x, y, Prota_Obj.x, Prota_Obj.y);
    player_near = (d <= interaction_distance);

}
