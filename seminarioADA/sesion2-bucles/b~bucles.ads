with System;
package Ada_Main is

   gnat_argc : Integer;
   gnat_argv : System.Address;
   gnat_envp : System.Address;

   pragma Import (C, gnat_argc);
   pragma Import (C, gnat_argv);
   pragma Import (C, gnat_envp);

   gnat_exit_status : Integer;
   pragma Import (C, gnat_exit_status);

   procedure adafinal;
   pragma Export (C, adafinal);

   procedure adainit;
   pragma Export (C, adainit);

   procedure Break_Start;
   pragma Import (C, Break_Start, "__gnat_break_start");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer;
   pragma Export (C, main, "main");

   u00001 : constant Integer := 16#3A4B0E11#;
   u00002 : constant Integer := 16#1D4BE45E#;
   u00003 : constant Integer := 16#31577D5D#;
   u00004 : constant Integer := 16#21031349#;
   u00005 : constant Integer := 16#6248B41E#;
   u00006 : constant Integer := 16#2359F9ED#;
   u00007 : constant Integer := 16#156A40CF#;
   u00008 : constant Integer := 16#033DABE0#;
   u00009 : constant Integer := 16#6AB38FEA#;
   u00010 : constant Integer := 16#27FE3586#;
   u00011 : constant Integer := 16#56BBE4F1#;
   u00012 : constant Integer := 16#5BA06B89#;
   u00013 : constant Integer := 16#0221E7C8#;
   u00014 : constant Integer := 16#134B7763#;
   u00015 : constant Integer := 16#08258E1B#;
   u00016 : constant Integer := 16#367D5222#;
   u00017 : constant Integer := 16#0C63B0E1#;
   u00018 : constant Integer := 16#01D2C69F#;
   u00019 : constant Integer := 16#31FB20F4#;
   u00020 : constant Integer := 16#2F1EB794#;
   u00021 : constant Integer := 16#39F8FFC7#;
   u00022 : constant Integer := 16#6B26CE53#;
   u00023 : constant Integer := 16#595A5A0A#;
   u00024 : constant Integer := 16#3DF26A18#;
   u00025 : constant Integer := 16#0F1BB294#;
   u00026 : constant Integer := 16#2E6D0426#;
   u00027 : constant Integer := 16#40442E6A#;
   u00028 : constant Integer := 16#0651CC0C#;
   u00029 : constant Integer := 16#7B4D80ED#;
   u00030 : constant Integer := 16#742B318F#;
   u00031 : constant Integer := 16#71096D18#;
   u00032 : constant Integer := 16#0E685CA4#;
   u00033 : constant Integer := 16#4016DC05#;
   u00034 : constant Integer := 16#1B981D87#;
   u00035 : constant Integer := 16#16585895#;
   u00036 : constant Integer := 16#7B91C7A0#;
   u00037 : constant Integer := 16#79D09598#;
   u00038 : constant Integer := 16#6A42315C#;
   u00039 : constant Integer := 16#524A03E3#;
   u00040 : constant Integer := 16#79CE2327#;
   u00041 : constant Integer := 16#0B5071CF#;
   u00042 : constant Integer := 16#60C36E5C#;
   u00043 : constant Integer := 16#7202CBD1#;
   u00044 : constant Integer := 16#0F7193E3#;
   u00045 : constant Integer := 16#16952D8B#;
   u00046 : constant Integer := 16#325DDA1F#;
   u00047 : constant Integer := 16#644FBE04#;
   u00048 : constant Integer := 16#4F9B5906#;
   u00049 : constant Integer := 16#260306DA#;
   u00050 : constant Integer := 16#54AB61A8#;
   u00051 : constant Integer := 16#6371166A#;
   u00052 : constant Integer := 16#3DEC36D4#;
   u00053 : constant Integer := 16#7EF5B3F5#;
   u00054 : constant Integer := 16#21F7877D#;
   u00055 : constant Integer := 16#0D83A3EA#;
   u00056 : constant Integer := 16#0388ABD4#;
   u00057 : constant Integer := 16#0B97C6BF#;
   u00058 : constant Integer := 16#34B32999#;
   u00059 : constant Integer := 16#4F0184F2#;
   u00060 : constant Integer := 16#0A0669D8#;
   u00061 : constant Integer := 16#26610831#;
   u00062 : constant Integer := 16#3C88F424#;
   u00063 : constant Integer := 16#7C25DE96#;
   u00064 : constant Integer := 16#65CAA177#;
   u00065 : constant Integer := 16#5F4E7864#;
   u00066 : constant Integer := 16#03F36D98#;
   u00067 : constant Integer := 16#175F872B#;
   u00068 : constant Integer := 16#1D4F93E8#;
   u00069 : constant Integer := 16#30B2EC3D#;
   u00070 : constant Integer := 16#34054F96#;
   u00071 : constant Integer := 16#66F773CD#;
   u00072 : constant Integer := 16#20A8E82B#;
   u00073 : constant Integer := 16#1CBC39CD#;
   u00074 : constant Integer := 16#63B302E3#;
   u00075 : constant Integer := 16#1307539C#;
   u00076 : constant Integer := 16#61897F59#;
   u00077 : constant Integer := 16#3B9DA6D5#;
   u00078 : constant Integer := 16#2DF1D194#;
   u00079 : constant Integer := 16#61E757F8#;
   u00080 : constant Integer := 16#53842B76#;
   u00081 : constant Integer := 16#4271AE2E#;
   u00082 : constant Integer := 16#736E0B75#;
   u00083 : constant Integer := 16#080C3AA1#;
   u00084 : constant Integer := 16#1120FB80#;
   u00085 : constant Integer := 16#77F167EF#;
   u00086 : constant Integer := 16#7BB26C80#;
   u00087 : constant Integer := 16#2E257CBC#;
   u00088 : constant Integer := 16#403EA0CF#;
   u00089 : constant Integer := 16#259E043B#;
   u00090 : constant Integer := 16#0357E00A#;
   u00091 : constant Integer := 16#02301BD8#;
   u00092 : constant Integer := 16#165E2B21#;

   pragma Export (C, u00001, "buclesB");
   pragma Export (C, u00002, "system__standard_libraryB");
   pragma Export (C, u00003, "system__standard_libraryS");
   pragma Export (C, u00004, "ada__exceptionsB");
   pragma Export (C, u00005, "ada__exceptionsS");
   pragma Export (C, u00006, "adaS");
   pragma Export (C, u00007, "gnatS");
   pragma Export (C, u00008, "gnat__heap_sort_aB");
   pragma Export (C, u00009, "gnat__heap_sort_aS");
   pragma Export (C, u00010, "systemS");
   pragma Export (C, u00011, "kernelS");
   pragma Export (C, u00012, "kernel__parametersS");
   pragma Export (C, u00013, "system__exception_tableB");
   pragma Export (C, u00014, "system__exception_tableS");
   pragma Export (C, u00015, "gnat__htableB");
   pragma Export (C, u00016, "gnat__htableS");
   pragma Export (C, u00017, "system__exceptionsS");
   pragma Export (C, u00018, "system__machine_state_operationsB");
   pragma Export (C, u00019, "system__machine_state_operationsS");
   pragma Export (C, u00020, "system__storage_elementsB");
   pragma Export (C, u00021, "system__storage_elementsS");
   pragma Export (C, u00022, "system__secondary_stackB");
   pragma Export (C, u00023, "system__secondary_stackS");
   pragma Export (C, u00024, "system__parametersB");
   pragma Export (C, u00025, "system__parametersS");
   pragma Export (C, u00026, "system__soft_linksB");
   pragma Export (C, u00027, "system__soft_linksS");
   pragma Export (C, u00028, "system__stack_checkingB");
   pragma Export (C, u00029, "system__stack_checkingS");
   pragma Export (C, u00030, "system__tracebackB");
   pragma Export (C, u00031, "system__tracebackS");
   pragma Export (C, u00032, "kernel__serial_outputB");
   pragma Export (C, u00033, "kernel__serial_outputS");
   pragma Export (C, u00034, "ada__charactersS");
   pragma Export (C, u00035, "ada__characters__latin_1S");
   pragma Export (C, u00036, "kernel__peripheralsB");
   pragma Export (C, u00037, "kernel__peripheralsS");
   pragma Export (C, u00038, "kernel__peripherals__registersS");
   pragma Export (C, u00039, "system__unsigned_typesS");
   pragma Export (C, u00040, "system__img_intB");
   pragma Export (C, u00041, "system__img_intS");
   pragma Export (C, u00042, "kernel__threadsB");
   pragma Export (C, u00043, "kernel__threadsS");
   pragma Export (C, u00044, "kernel__memoryB");
   pragma Export (C, u00045, "kernel__memoryS");
   pragma Export (C, u00046, "kernel__threads__protectionB");
   pragma Export (C, u00047, "kernel__threads__protectionS");
   pragma Export (C, u00048, "kernel__cpu_primitivesB");
   pragma Export (C, u00049, "kernel__cpu_primitivesS");
   pragma Export (C, u00050, "system__machine_codeS");
   pragma Export (C, u00051, "kernel__threads__queuesB");
   pragma Export (C, u00052, "kernel__threads__queuesS");
   pragma Export (C, u00053, "kernel__timeB");
   pragma Export (C, u00054, "kernel__timeS");
   pragma Export (C, u00055, "kernel__interruptsB");
   pragma Export (C, u00056, "kernel__interruptsS");
   pragma Export (C, u00057, "ada__finalization__list_controllerB");
   pragma Export (C, u00058, "ada__finalization__list_controllerS");
   pragma Export (C, u00059, "ada__finalizationB");
   pragma Export (C, u00060, "ada__finalizationS");
   pragma Export (C, u00061, "system__finalization_rootB");
   pragma Export (C, u00062, "system__finalization_rootS");
   pragma Export (C, u00063, "ada__streamsS");
   pragma Export (C, u00064, "ada__tagsB");
   pragma Export (C, u00065, "ada__tagsS");
   pragma Export (C, u00066, "system__string_opsB");
   pragma Export (C, u00067, "system__string_opsS");
   pragma Export (C, u00068, "system__stream_attributesB");
   pragma Export (C, u00069, "system__stream_attributesS");
   pragma Export (C, u00070, "ada__io_exceptionsS");
   pragma Export (C, u00071, "system__finalization_implementationB");
   pragma Export (C, u00072, "system__finalization_implementationS");
   pragma Export (C, u00073, "system__string_ops_concat_3B");
   pragma Export (C, u00074, "system__string_ops_concat_3S");
   pragma Export (C, u00075, "system__taskingB");
   pragma Export (C, u00076, "system__taskingS");
   pragma Export (C, u00077, "system__task_primitivesS");
   pragma Export (C, u00078, "system__task_primitives__operationsB");
   pragma Export (C, u00079, "system__task_primitives__operationsS");
   pragma Export (C, u00080, "kernel__threads__atcbB");
   pragma Export (C, u00081, "kernel__threads__atcbS");
   pragma Export (C, u00082, "system__os_interfaceB");
   pragma Export (C, u00083, "system__os_interfaceS");
   pragma Export (C, u00084, "system__os_primitivesB");
   pragma Export (C, u00085, "system__os_primitivesS");
   pragma Export (C, u00086, "system__tasking__debugB");
   pragma Export (C, u00087, "system__tasking__debugS");
   pragma Export (C, u00088, "system__task_infoB");
   pragma Export (C, u00089, "system__task_infoS");
   pragma Export (C, u00090, "interfacesS");
   pragma Export (C, u00091, "interfaces__cB");
   pragma Export (C, u00092, "interfaces__cS");

end Ada_Main;
