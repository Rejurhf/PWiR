pragma Ada_95;
pragma Warnings (Off);
pragma Source_File_Name (ada_main, Spec_File_Name => "b~sensor.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b~sensor.adb");
pragma Suppress (Overflow_Check);

with System.Restrictions;
with Ada.Exceptions;

package body ada_main is

   E013 : Short_Integer; pragma Import (Ada, E013, "system__soft_links_E");
   E023 : Short_Integer; pragma Import (Ada, E023, "system__exception_table_E");
   E025 : Short_Integer; pragma Import (Ada, E025, "system__exceptions_E");
   E017 : Short_Integer; pragma Import (Ada, E017, "system__secondary_stack_E");
   E052 : Short_Integer; pragma Import (Ada, E052, "ada__io_exceptions_E");
   E091 : Short_Integer; pragma Import (Ada, E091, "ada__numerics_E");
   E075 : Short_Integer; pragma Import (Ada, E075, "interfaces__c_E");
   E115 : Short_Integer; pragma Import (Ada, E115, "interfaces__c__strings_E");
   E077 : Short_Integer; pragma Import (Ada, E077, "system__os_lib_E");
   E164 : Short_Integer; pragma Import (Ada, E164, "system__task_info_E");
   E054 : Short_Integer; pragma Import (Ada, E054, "ada__tags_E");
   E051 : Short_Integer; pragma Import (Ada, E051, "ada__streams_E");
   E080 : Short_Integer; pragma Import (Ada, E080, "system__file_control_block_E");
   E073 : Short_Integer; pragma Import (Ada, E073, "system__finalization_root_E");
   E071 : Short_Integer; pragma Import (Ada, E071, "ada__finalization_E");
   E070 : Short_Integer; pragma Import (Ada, E070, "system__file_io_E");
   E144 : Short_Integer; pragma Import (Ada, E144, "ada__streams__stream_io_E");
   E123 : Short_Integer; pragma Import (Ada, E123, "system__storage_pools_E");
   E129 : Short_Integer; pragma Import (Ada, E129, "system__finalization_masters_E");
   E084 : Short_Integer; pragma Import (Ada, E084, "ada__calendar_E");
   E088 : Short_Integer; pragma Import (Ada, E088, "ada__calendar__delays_E");
   E006 : Short_Integer; pragma Import (Ada, E006, "ada__text_io_E");
   E198 : Short_Integer; pragma Import (Ada, E198, "ada__real_time_E");
   E119 : Short_Integer; pragma Import (Ada, E119, "system__pool_global_E");
   E125 : Short_Integer; pragma Import (Ada, E125, "system__pool_size_E");
   E104 : Short_Integer; pragma Import (Ada, E104, "gnat__sockets_E");
   E113 : Short_Integer; pragma Import (Ada, E113, "gnat__sockets__thin_common_E");
   E107 : Short_Integer; pragma Import (Ada, E107, "gnat__sockets__thin_E");
   E099 : Short_Integer; pragma Import (Ada, E099, "system__random_seed_E");
   E174 : Short_Integer; pragma Import (Ada, E174, "system__tasking__initialization_E");
   E184 : Short_Integer; pragma Import (Ada, E184, "system__tasking__protected_objects_E");
   E186 : Short_Integer; pragma Import (Ada, E186, "system__tasking__protected_objects__entries_E");
   E182 : Short_Integer; pragma Import (Ada, E182, "system__tasking__queuing_E");
   E146 : Short_Integer; pragma Import (Ada, E146, "system__tasking__stages_E");
   E082 : Short_Integer; pragma Import (Ada, E082, "sensor_pak_E");

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      E186 := E186 - 1;
      declare
         procedure F1;
         pragma Import (Ada, F1, "system__tasking__protected_objects__entries__finalize_spec");
      begin
         F1;
      end;
      declare
         procedure F2;
         pragma Import (Ada, F2, "gnat__sockets__finalize_body");
      begin
         E104 := E104 - 1;
         F2;
      end;
      declare
         procedure F3;
         pragma Import (Ada, F3, "gnat__sockets__finalize_spec");
      begin
         F3;
      end;
      E125 := E125 - 1;
      declare
         procedure F4;
         pragma Import (Ada, F4, "system__pool_size__finalize_spec");
      begin
         F4;
      end;
      E119 := E119 - 1;
      declare
         procedure F5;
         pragma Import (Ada, F5, "system__pool_global__finalize_spec");
      begin
         F5;
      end;
      E006 := E006 - 1;
      declare
         procedure F6;
         pragma Import (Ada, F6, "ada__text_io__finalize_spec");
      begin
         F6;
      end;
      E129 := E129 - 1;
      declare
         procedure F7;
         pragma Import (Ada, F7, "system__finalization_masters__finalize_spec");
      begin
         F7;
      end;
      E144 := E144 - 1;
      declare
         procedure F8;
         pragma Import (Ada, F8, "ada__streams__stream_io__finalize_spec");
      begin
         F8;
      end;
      declare
         procedure F9;
         pragma Import (Ada, F9, "system__file_io__finalize_body");
      begin
         E070 := E070 - 1;
         F9;
      end;
      declare
         procedure Reraise_Library_Exception_If_Any;
            pragma Import (Ada, Reraise_Library_Exception_If_Any, "__gnat_reraise_library_exception_if_any");
      begin
         Reraise_Library_Exception_If_Any;
      end;
   end finalize_library;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (C, s_stalib_adafinal, "system__standard_library__adafinal");

      procedure Runtime_Finalize;
      pragma Import (C, Runtime_Finalize, "__gnat_runtime_finalize");

   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      Runtime_Finalize;
      s_stalib_adafinal;
   end adafinal;

   type No_Param_Proc is access procedure;

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Leap_Seconds_Support : Integer;
      pragma Import (C, Leap_Seconds_Support, "__gl_leap_seconds_support");
      Bind_Env_Addr : System.Address;
      pragma Import (C, Bind_Env_Addr, "__gl_bind_env_addr");

      procedure Runtime_Initialize (Install_Handler : Integer);
      pragma Import (C, Runtime_Initialize, "__gnat_runtime_initialize");

      Finalize_Library_Objects : No_Param_Proc;
      pragma Import (C, Finalize_Library_Objects, "__gnat_finalize_library_objects");
   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := 0;
      Time_Slice_Value := -1;
      WC_Encoding := 'b';
      Locking_Policy := ' ';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := ' ';
      System.Restrictions.Run_Time_Restrictions :=
        (Set =>
          (False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, True, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False),
         Value => (0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         Violated =>
          (False, False, False, True, True, False, False, True, 
           False, False, True, True, True, True, False, False, 
           True, False, False, True, True, False, True, True, 
           False, True, True, True, True, False, False, False, 
           False, False, True, False, False, True, False, True, 
           False, False, True, False, True, False, True, False, 
           False, False, True, False, True, False, False, False, 
           False, False, True, False, True, True, True, False, 
           False, True, False, True, True, True, False, True, 
           True, False, True, True, True, True, False, False, 
           True, False, False, False, False, False, False, True, 
           False, False, False),
         Count => (0, 0, 0, 0, 0, 0, 1, 0, 0, 0),
         Unknown => (False, False, False, False, False, False, False, False, False, False));
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Detect_Blocking := 0;
      Default_Stack_Size := -1;
      Leap_Seconds_Support := 0;

      Runtime_Initialize (1);

      Finalize_Library_Objects := finalize_library'access;

      System.Soft_Links'Elab_Spec;
      System.Exception_Table'Elab_Body;
      E023 := E023 + 1;
      System.Exceptions'Elab_Spec;
      E025 := E025 + 1;
      System.Soft_Links'Elab_Body;
      E013 := E013 + 1;
      System.Secondary_Stack'Elab_Body;
      E017 := E017 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E052 := E052 + 1;
      Ada.Numerics'Elab_Spec;
      E091 := E091 + 1;
      Interfaces.C'Elab_Spec;
      E075 := E075 + 1;
      Interfaces.C.Strings'Elab_Spec;
      E115 := E115 + 1;
      System.Os_Lib'Elab_Body;
      E077 := E077 + 1;
      System.Task_Info'Elab_Spec;
      E164 := E164 + 1;
      Ada.Tags'Elab_Spec;
      Ada.Tags'Elab_Body;
      E054 := E054 + 1;
      Ada.Streams'Elab_Spec;
      E051 := E051 + 1;
      System.File_Control_Block'Elab_Spec;
      E080 := E080 + 1;
      System.Finalization_Root'Elab_Spec;
      E073 := E073 + 1;
      Ada.Finalization'Elab_Spec;
      E071 := E071 + 1;
      System.File_Io'Elab_Body;
      E070 := E070 + 1;
      Ada.Streams.Stream_Io'Elab_Spec;
      E144 := E144 + 1;
      System.Storage_Pools'Elab_Spec;
      E123 := E123 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Finalization_Masters'Elab_Body;
      E129 := E129 + 1;
      Ada.Calendar'Elab_Spec;
      Ada.Calendar'Elab_Body;
      E084 := E084 + 1;
      Ada.Calendar.Delays'Elab_Body;
      E088 := E088 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E006 := E006 + 1;
      Ada.Real_Time'Elab_Spec;
      Ada.Real_Time'Elab_Body;
      E198 := E198 + 1;
      System.Pool_Global'Elab_Spec;
      E119 := E119 + 1;
      System.Pool_Size'Elab_Spec;
      E125 := E125 + 1;
      Gnat.Sockets'Elab_Spec;
      Gnat.Sockets.Thin_Common'Elab_Spec;
      E113 := E113 + 1;
      E107 := E107 + 1;
      Gnat.Sockets'Elab_Body;
      E104 := E104 + 1;
      System.Random_Seed'Elab_Body;
      E099 := E099 + 1;
      System.Tasking.Initialization'Elab_Body;
      E174 := E174 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E184 := E184 + 1;
      System.Tasking.Protected_Objects.Entries'Elab_Spec;
      E186 := E186 + 1;
      System.Tasking.Queuing'Elab_Body;
      E182 := E182 + 1;
      System.Tasking.Stages'Elab_Body;
      E146 := E146 + 1;
      Sensor_Pak'Elab_Spec;
      Sensor_Pak'Elab_Body;
      E082 := E082 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_sensor");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer
   is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      gnat_argc := argc;
      gnat_argv := argv;
      gnat_envp := envp;

      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
      return (gnat_exit_status);
   end;

--  BEGIN Object file/option list
   --   /mnt/d/Documents/Studia/PWiR/Ada/lab09/KursAdaStrumienie/socket-strim/sensor_pak.o
   --   /mnt/d/Documents/Studia/PWiR/Ada/lab09/KursAdaStrumienie/socket-strim/sensor.o
   --   -L/mnt/d/Documents/Studia/PWiR/Ada/lab09/KursAdaStrumienie/socket-strim/
   --   -L/mnt/d/Documents/Studia/PWiR/Ada/lab09/KursAdaStrumienie/socket-strim/
   --   -L/usr/lib/gcc/x86_64-linux-gnu/7/adalib/
   --   -shared
   --   -lgnarl-7
   --   -lgnat-7
   --   -lpthread
   --   -lrt
--  END Object file/option list   

end ada_main;
