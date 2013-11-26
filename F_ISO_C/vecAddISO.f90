module vector
  INTERFACE
    subroutine vecadd_wrapper() BIND (C, NAME='vecAdd_wrapper')
      USE ISO_C_BINDING
      implicit none
    end subroutine vecadd_wrapper
  END INTERFACE
end module vector
 
program vecAdd
    use ISO_C_BINDING
    use vector
 
    call vecadd_wrapper()
 
end program vecAdd
