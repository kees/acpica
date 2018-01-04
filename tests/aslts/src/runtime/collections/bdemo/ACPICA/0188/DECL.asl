    /*
     * Some or all of this work - Copyright (c) 2006 - 2017, Intel Corp.
     * All rights reserved.
     *
     * Redistribution and use in source and binary forms, with or without modification,
     * are permitted provided that the following conditions are met:
     *
     * Redistributions of source code must retain the above copyright notice,
     * this list of conditions and the following disclaimer.
     * Redistributions in binary form must reproduce the above copyright notice,
     * this list of conditions and the following disclaimer in the documentation
     * and/or other materials provided with the distribution.
     * Neither the name of Intel Corporation nor the names of its contributors
     * may be used to endorse or promote products derived from this software
     * without specific prior written permission.
     *
     * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
     * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
     * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
     * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
     * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
     * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
     * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
     * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
     * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
     * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
     */
    /*
     * Bug 188:
     *
     * SUMMARY: ConcatenateResTemplate doesn't consume an empty buffer
     */
    Method (MF7C, 0, Serialized)
    {
        Name (B000, ResourceTemplate ()
        {
            IRQNoFlags ()
                {1}
        })
        Name (RT00, ResourceTemplate ()
        {
            IRQNoFlags ()
                {1}
        })
        /* Empty buffer */

        CH03 ("", 0x00, 0x00, 0x2A, 0x00)
        Local0 = 0x00
        Local1 = Buffer (Local0){}
        Local2 = ConcatenateResTemplate (RT00, Local1)
        If ((Local2 != B000))
        {
            ERR ("", ZFFF, 0x32, 0x00, 0x00, Local2, B000)
        }

        If ((RT00 != B000))
        {
            ERR ("", ZFFF, 0x36, 0x00, 0x00, RT00, B000)
        }

        CH03 ("", 0x00, 0x03, 0x39, 0x00)
    }
