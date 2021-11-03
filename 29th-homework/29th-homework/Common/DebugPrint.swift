//
//  DebugPrint.swift
//  29th-homework
//
//  Created by 1v1 on 2021/11/03.
//

func dPrint(_ index:String, _ msg: Any){
#if DEBUG
    print("#", index, "# msg: ", msg)
#endif
}
