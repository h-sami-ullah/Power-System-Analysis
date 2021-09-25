nbus=input('Enter the total no of bus excluding ref bus:');
Quit = 0;
i = 0;
disp('Case 1: New Bus to Refference Bus');
disp('Case 2: Existing Bus to New Bus');
disp('Case 3: Existing Bus to Refference Bus');
disp('Case 4: Existing Bus to Existing Bus');
while Quit== 0
    
        Case = input('Which case is to be implemented = ');
        if Case == 1
         if i == 0
            Zb = input('Enter the value of impedance = ');
             Zbus = [Zb]
         end
         if i>0
            Zb = input('Enter the value of impedance = ');
            ord = length(Zb1);
            for d = 1:ord+1
                for e = i:ord+1
                    if d<=ord && e<=ord
                    Zbus1(d,e) = Zb1(d,e);
                    end
                    if d==ord+1 && e==ord+1
                        Zbus1(d,e)=Zb;
                    end
                    if d==ord+1 && d~=e || e==ord+1 && d~=e
                        Zbus1(d,e)= 0;
                    end
                    
                end
            end
            
            Zbus = [Zbus1]
          end
        end
      if Case == 2
          Z_new = input('Enter the value of impedance for new bus = ');
          m = length(Zbus);  
          for a=1:m
                for b=1:m
                    Z_temp(a,b) = Zbus(a,b);
                end
          end          
      for c = 1:m
                Z_temp(c,m+1) = Zbus(c,m);
                Z_temp(m+1,c) = Zbus(c,m);
                Z_temp(m+1,m+1) = Zbus(m,m)+Z_new;
       end
       Zbus = [Z_temp] 
       i = i+1;
      end
      if Case == 3
          Z_new = input('Enter the value of impedance for new bus = ');
          m = length(Zbus);  
          for a=1:m
                for b=1:m
                    Z_temp(a,b) = Zbus(a,b);
                end
          end
        for c = 1:m
                Z_temp(c,m+1) = Zbus(c,m);
                Z_temp(m+1,c) = Zbus(c,m);
                Z_temp(m+1,m+1) = Zbus(m,m)+Z_new;
        end
        fprintf('Zbus before Kron Reduction:\n')
        Zbus = [Z_temp]
        m = length(Zbus);
        for i=1:m-1
            for k = 1:m-1
                Z(i,k) = Zbus(i,k) - ((Zbus(i,m)*Zbus(m,k))/Zbus(m,m));
            end
        end
        fprintf('Zbus after Kron Reduction:\n')
        Zbus = [Z]
      end
      if Case == 4
          Z1 = input('Enter the value of impedance = ');
          j = input('Enter the value of bus j = ');
          k = input('Enter the value of bus k = ');
          m = length(Zbus);  
          for a=1:m
                for b=1:m
                    Z_temp(a,b) = Zbus(a,b);
                end
          end        
        for c = 1:m
                Z_temp(c,m+1) = Zbus(c,j)-Zbus(c,k);
                Z_temp(m+1,c) = Z_temp(c,m+1);
        end
        Z_temp(m+1,m+1) = Z1+Zbus(j,j)+Zbus(k,k)-2*Zbus(j,k);
        fprintf('Zbus before Kron Reduction:\n')
        Zbus = [Z_temp]
        m = length(Zbus);
        for i=1:m-1
            for k = 1:m-1
                Z(i,k) = Zbus(i,k) - ((Zbus(i,m)*Zbus(m,k))/Zbus(m,m));
            end
        end
            fprintf('Zbus after Kron Reduction:\n')      
            Zbus = [Z]
     end
      if max(size(Zbus))==nbus
          Quit = input('Do u want to quit = ');
      end
          Zb1 = [Zbus];
end
