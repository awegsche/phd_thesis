#%%
from PyPDF2 import PdfFileReader



pdf = PdfFileReader("./particle_traj_beta_1.pdf")

firstpage = pdf.getPage(0)

print(firstpage.getContents())

for content in firstpage.getContents():
    print(content)
