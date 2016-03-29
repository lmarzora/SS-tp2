function neighbours = cellIndexMethod(matrix, particles, periodic, L, rc, N, M)
		neighbours = cell(1,N);
		for i = 1:length(matrix(1,:))
			for j = 1:length(matrix(:,1))
				if(!isempty(matrix{i,j}))
					pos = {[i-1,j], [i-1, j+1], [i,j+1] , [i + 1, j + 1]};
					for next = pos
						if(periodic && ! isValid(next,M))
							next = getPeriodicPos(next,M);
						endif			
						if(isValid(next,M))
							x = next{1}(1);
							y = next{1}(2);
							if(!isempty(matrix{x,y}))
								neighbours = addNeighbours(matrix{i,j},matrix{x,y},rc,L,periodic,particles,neighbours,false);	
							endif	
						endif		
					endfor
					neighbours = addNeighbours(matrix{i,j},matrix{i,j},rc,L,periodic,particles,neighbours,true);
				endif
			endfor
		endfor

endfunction


function valid = isValid(pos,M)
	x = pos{1}(1);
	y = pos{1}(2);

	if (x < 1 || y < 1 || x > M || y > M)
		valid = false;
		return
	endif
		valid = true;
endfunction

function pos = getPeriodicPos(pos,M)
	x = pos{1}(1);
	y = pos{1}(2);
	row = getPIndex(x,M);
	col = getPIndex(y,M);
	pos = {[row,col]};
endfunction
	


function p_index = getPIndex(k,M)
	if(k<1)
		p_index = M + k;
	else if(k>M)
		p_index = k - M;
		else
			p_index = k;	
		endif
	endif
endfunction
