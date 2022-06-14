local a = vim.fn.getqflist()
table.sort(a, function(a,b) 
return b.bufnr < a.bufnr
end)
vim.fn.setqflist(a)
