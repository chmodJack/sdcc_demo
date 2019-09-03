TARGET=LED3.hex

SRC_DIR=./sources
OBJS_DIR:=./objs
LINK_DIR:=./links

APP_CSRCS=main.c common.c isr.c

CSRCS:=$(addprefix $(SRC_DIR)/,$(APP_CSRCS))
COBJS:=$(addprefix $(OBJS_DIR)/, $(patsubst %.c,%.rel,$(notdir $(CSRCS))))

CC=sdcc 
MAKEHEX=packihx
MAKEBIN=makebin -Z

RM=rm


CFLAGS+=-I./include
CFLAGS+=-mmcs51 --model-small --std-sdcc99
#CFLAGS+=--verbose


LDFLAGS+=--verbose


all : hex bin

hex:$(LINK_DIR)/main.ihx
	$(MAKEHEX) $(LINK_DIR)/main.ihx > $(TARGET)
	
bin:$(LINK_DIR)/main.ihx
	$(MAKEBIN) $(LINK_DIR)/main.ihx $(patsubst %.hex,%.bin,$(TARGET))

$(LINK_DIR)/main.ihx:$(COBJS)
	$(CC) $(LDFLAGS) $(COBJS) -o$(LINK_DIR)/

$(OBJS_DIR)/%.rel:$(SRC_DIR)/%.c
	$(CC) -c $(CFLAGS) $< -o$(OBJS_DIR)/
	
.PHONY:clean
clean:
	-rm -rf $(OBJS_DIR)/*
	-rm -rf $(LINK_DIR)/*
	-rm -rf ./$(TARGET)
