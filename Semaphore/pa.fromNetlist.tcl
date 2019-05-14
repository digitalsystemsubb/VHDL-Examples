
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name Semaphore -dir "F:/Cursos/SistemasDigitales/ISE/Semaphore/planAhead_run_2" -part xc6slx16csg324-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "F:/Cursos/SistemasDigitales/ISE/Semaphore/top_module.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {F:/Cursos/SistemasDigitales/ISE/Semaphore} }
set_property target_constrs_file "Nexys3_master.ucf" [current_fileset -constrset]
add_files [list {Nexys3_master.ucf}] -fileset [get_property constrset [current_run]]
link_design
