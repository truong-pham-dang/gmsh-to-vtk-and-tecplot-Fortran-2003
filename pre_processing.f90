
subroutine pre_processing
    use mod_read_gmsh
    use mod_write_vtk
    use mod_cell_2D
    !use mod_fvm_face_2D
    implicit none

    type(obj_cell_2D), target :: list_cell
    type(msh_vis)             :: visualizer
    
    call list_cell%read_msh()
    call list_cell%assign_id_nodes() 
    
    call list_cell%build_cells()
    call list_cell%find_neighbor()
    
    visualizer%smart_pointer => list_cell
    call visualizer%write_vtk()
    call visualizer%write_tecplot()
    
    !call calcul_vol_cells    
    !call calcul_area_cent_faces    
    !call assign_id_face_v2   
    !call allocate_face_2D  
    !call assign_face_2D 

end subroutine pre_processing 

