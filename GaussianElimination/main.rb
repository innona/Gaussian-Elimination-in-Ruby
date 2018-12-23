def debug(str)
  #puts str
end

def input_matrix(mat)
  puts 'Please input the num of rows that matrix contains'
  num = gets.to_i
  num.times do
    tmp = gets.split(' ').map(&:to_f)
    mat.push(tmp)
  end
  mat
end

def debug_check(mat)
  puts 'Matrix:'
  mat.each do |i|
    i.each do |j|
      printf('%8.2f', j)
    end
    puts
  end
end

def reduce_down(mat)
  num_row = mat.length
  debug "The num of rows: #{num_row}"
  #  i row represent triangle
  for i in (0...num_row - 1)
    debug "i: #{i}"
    # j row represent to eliminate
    for j in (i+1...num_row)
      debug "j: #{j}"
      head = mat[i][i]
      nexthead = mat[j][i]
      subtor = nexthead/head
      #k column
      for k in (i...num_row+1)
        mat[j][k] -= mat[i][k]*subtor
      end
    end
  end
  mat
end

def one_ify_leads(mat)
  num_row = mat.length
  for i in (0...num_row)
    subtor =  mat[i][i]
    for j in (i...num_row+1)
      mat[i][j] /= subtor
    end
  end
end

def reduce_up(mat)
  num_row = mat.length
  # i row for find head position
  for i in ((num_row-1).downto(1))

    #j row for find nexthead position
    for j in ((i-1).downto(0))
      head = mat[i][i]
      nexthead = mat[j][i]
      subtor = nexthead/head
      debug "i: #{i} j: #{j} subtor #{subtor}"
      debug_check(mat)
      # k column for revise j row parameter
      mat[j][i] -= mat[i][i]*subtor
      mat[j][num_row] -= mat[i][num_row]*subtor
    end
  end
  mat
end

# initialize parameter
mat = []


# get input
input_matrix(mat)

# debug check input
debug_check(mat)

# reduce down
reduce_down(mat)

# debug check input
debug_check(mat)

# make all leads to 1
one_ify_leads(mat)

# debug check input
debug_check(mat)

# reduce up
reduce_up(mat)

# debug check input
debug_check(mat)
