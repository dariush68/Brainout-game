
//-- check obj containing --//
//-- window: container of onj_source and obj_destinition --//
//-- obj_src: draged object --//
//-- obj_des: droped area object --//
//-- offst: sensitivity of detection --//
//-- return 3 state; '' for no cantain, 'DES_IN_SRC' for obj_src contain obj_des, 'SRC_IN_DES' for obj_des contain obj_src --//
function isContain(window, obj_src, obj_des, offst){


    var pos_src = window.mapFromItem (obj_src.parent, obj_src.x, obj_src.y);
    var pos_dst = window.mapFromItem (obj_des.parent, obj_des.x, obj_des.y);

    const src_x_start   = pos_src.x - offst;
    const src_x_end     = pos_src.x + obj_src.width + offst;
    const src_y_start   = pos_src.y - offst;
    const src_y_end     = pos_src.y + obj_src.height + offst;

    const des_x_start   = pos_dst.x - offst;
    const des_x_end     = pos_dst.x + obj_des.width + offst;
    const des_y_start   = pos_dst.y - offst;
    const des_y_end     = pos_dst.y + obj_des.height + offst;


    if(src_x_start < pos_dst.x){
        if(src_x_end >= pos_dst.x + obj_des.width){
            if(src_y_start < pos_dst.y){
                if(src_y_end >= pos_dst.y + obj_des.height){
                    return "DES_IN_SRC"
                }
            }
        }
    }

    if(des_x_start < pos_src.x){
        if(des_x_end >= pos_src.x + obj_src.width){
            if(des_y_start < pos_src.y){
                if(des_y_end >= pos_src.y + obj_src.height){
                    return "SRC_IN_DES"
                }
            }
        }
    }

    return ""
}
