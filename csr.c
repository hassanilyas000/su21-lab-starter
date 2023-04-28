#include <stdio.h>
#include <stdlib.h>

#define CSR_VAL 0x8000abcd00001234UL

#define ADDRESS 0x5300f000U

unsigned long int my_csr = CSR_VAL;

int main(void)
{
  printf("my_csr_orginal: %lx\n",my_csr);
  // (a) here:
  my_csr = my_csr | (1UL<<63);
  printf("a) my_csr: %lx\n",my_csr);

  // (b) here:
  my_csr = my_csr & ~(1UL<<61);
  printf("b) my_csr: %lx\n",my_csr);

  // (c) here:
   my_csr = (my_csr & 0xFFFFFFFFFF00FFFFUL) | (0xeeUL << 16);
  printf("c) my_csr: %lx\n",my_csr);

  // (d) here:
  unsigned int up = ADDRESS>>12;
  unsigned int mask=(0xfUL)<<16;
  up=(~mask) & (up);
  my_csr= my_csr & (0xFFFFFFFF0000FFFF) | (up<<16) ;
  printf("d) my_csr: %lx\n",my_csr);

  return 0;
}