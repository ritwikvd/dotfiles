vim.fn.setqflist(table.sort(vim.fn.getqflist(), function(a,b) 
return b.bufnr > a.bufnr
end))
