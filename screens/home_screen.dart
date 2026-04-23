import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';
import 'cart_screen.dart';
import '../widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static final List<Product> products = [
    Product(
      name: "Laptop",
      price: 15000,
      image: "data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBw8QEBUPEBAVEBAVDg8PDxAREhIVDw8QFREWFhYRFRYYHSohGBolHRYWIT0hJSkrLi4uFyAzODMsQygtLisBCgoKDg0OGxAPGzclHyU1NTU1Ny43NjcyMDE3NzcvNy8vNy0tMjU3LS0tLS0tLTcyLS0tLS83LTYtLS0tKys2N//AABEIAOAA4AMBIgACEQEDEQH/xAAcAAEAAQUBAQAAAAAAAAAAAAAAAgEDBQYHBAj/xABNEAABAwIDBQUDBgkGDwAAAAABAAIDBBEFEiEGBzFBYRMyUXGBIpGhFBUjQlKxQ2JygpKywcPRFhczNVTCNFNVZIOEk6Kj0tPh4/Dx/8QAGQEBAAMBAQAAAAAAAAAAAAAAAAIDBAUB/8QALhEBAAIAAwQJBAMBAAAAAAAAAAECAwQREhQxoRMzQVFSYXGBsSEicpEyweEF/9oADAMBAAIRAxEAPwDuKIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAi0XeVVVbX00dJKY3yGVptI9gcbxgd0anU8bWusbDRyQtAq8Zla++YtNRku08AAXZiOtgtFcCJrEzPFlvmJi01iuunm6Yi5FNWMYf64nk14CeUX46XH/uitfOo/ynONCP8ACJyNRxUt28+Uo71Ph5w7Ei44ypLnX+ep2iwFu3eBoAL3I9fVWqmaYkinxaeVwGoNRLr1FuV9Li/EL3do7bcpN6nw84doRaru2qJZKEOllfK/tpRnkc5zrAiwu7VbUs967Fpr3NOHfbrFo7RERQTEREBERAREQEREBERAREQEREBERAREQahtg+1bQDXWSbhwFsnHouc7d/1hLbhaC3l2Ea37bxxFZh5Db/Sz8ibeyzX/AOrnm2RvWPPjHTn300a7H/P/AJV/Gflxc/H22/KPhGhwOVwDzE6W5sIYzZ/ca8Oc7KQ0ZXA272o4XuvYKGrAb2dBF7QlIb2LpHt7OQxuD+0JIOYWt1CybhUzMmNExlTBUGZ7mtcPlFO6aIMdG9hIOltLAg2vzXujmxXMZJKOOJpLy580vZNbeYzNN84Iyuc7gNQegV18a88dPef61VUwaR9I19o/xr1Xh0b4nksjiqG0sdYBD2gY6FwjOV7XaNd9JoWni0gjUFY/Zxt5/H6KQ2/RXsx/E3gGnEsMuaOBs80Ad9J2bQGxZ3d5oyh1wBcnorWyLb1B6QSn9VTxItu9pshhzXeKxDp27W3yI5eHyme36S2tapu0baiI/wA5qP1lta4eP1lvV3Mv1VfSBERVLhERAREQEREBERAREQEREBERAREQEREGnbbNHyqiJNrOqLdTlaLLRMZoBPXytJcAylhlIjbmkflp4vYY2+p1v5Ankt327LvllBZ1gZZw4faGVmi55ti4iukLTYhsFiNCPoGcF2MlEzMaeGflxc7pG1M/X7o+Hon2aAjD2OlLzTGoDDFYj22N7PQ3Dvb+BXp/kmx17zSXEEctzGCCXszZWjNd1tdBqdLBYTDAx+btah0VnR5TckkOJDiNeWhXtjo6cgZqzx+sDkvEC15GbWz9MrbnXobar9JE6Tbky12JjWK83q/kmCHWmLXNa4AvZljlkysLTG6+sZLwM3K4PPSWB0bIK6eEOLuzp6pji5oHtNfbQAnkB7ytexDK1+Rji5rRlDswII42FtLctDra/RZPZGS1Q4k6mJw1Opu5q8x636G02tr7JYFqdNWK10dP3cgijIJBPyibVosO8OS2hanuzcTQ3Op+U1H662xcPH6y3q7mX6qvoIiKpcIiIMBttjz6CkM8cYkeZGRNDiRG0uv7bra2AB05mwuL3XMJd4eLg37WIdBCMo8rm/xXYMcwuOrp5KaTuyMy35sdxa8dQQD6LgNXSSRPfTyi0sTyx45G3Bw6EWI6EIM4N5OLj68B84D+x4VRvOxcf2Y+cEn7JVqhCoUG3N3pYuOLaQ/6CYfvldbvWxPnDSnyjmH7xaUVEoN6/nar/wCz0/8Axf8AmUhvdredJAfz5AtAKiUHQ/54Kr+xRf7Z4/uqo3yVHOgjP+suH7tc4KiUHTW75pOeHt9Ko/8ASUhvnPPD/dU/+JctKgUHWW752c6Bw8p2n+4FMb6IOdFL6SMK5CVbcg7H/PXS86Ko9HQn73BbXsftzRYndsJdHM1uZ0EwaJcl7Z25SQ5t7cDpcXtcL5uKv4ZiE1LMypgdkljeHsPLq1w5tIuCPAlB3neKbS0kga4lj5HDLwBvH3tOC1WStp5j2ktNLmsAQ6mzEAaWzhwzAddbLpeyuPRYhSsqotA4WkYe9FKO9GfI8+YIPNZdaaZjZrEacPNltlpm82149mmrjI+SkgMoyfy4nsHqb6e9eeRjND8gba4BsJgdefHgu3IrYzunZzlTbI7U67XKHGoaSgcxpdTyseTZwDX2afPNw1+C8FU2Onc51PDK59rNJY8jhfnewuBoOK7oihOa14xP7WRlNOEx+oapuzJ+QC7S09vMLEFpNnWzWPja/qtrRFmvbatNu9pw6bFYr3CIiimIiIC5xvZwG7W4jEPaYBHUgfWiJ9mT80mx6O/FXR1bnhbIx0b2hzHNLHtPBzSLEHpZB83Tt+sOBVkrNbQYM6hqpKR1ywfSU7z9eF18uviLEHq0rDPFtEEColSKiUESoFTKiUECoFTKiUECoFTKgUECoFXCoFBbKgVcKgUG2bs9rvm2qtI61JMWsqLn2YjwbOPLgfxTzyhfRjSCLjUEXBHAhfIZXa9y+2HbR/Ns7vpYmXpXH8JAPwf5TP1bfZJQdSREQEREBERAREQEREBERBp+8vZ01dL2sQvUU+aWOw9qRlvbi63ABHVoHMrjDnB7Q8eC+l1w/eBgPyGtLmC1NUl0kfhHLf24+gubjo6w4INSKiVclbYq0UFCoFSKiUESolSKgUESoFTKg5BAqBWfjwuIOMb73ytcx2axN9CAOHEeHNYrEaZsTrCRrxcgWIzAjiCEHjKgVMqBQQKnRVkkErJ4XZJY3iSN4+q4feORHMEhQKgUH1FsXtLHiVIypZZr+5PHe/ZTADMzy1BB5ghZ1fM+7ra04ZVh7iTSy5Y6po5Nv7MwHiwknqC4eC+lo5GuaHNIc0gOa4G4cCLgg8wgkiIgIiICIiAiIgIiICwm2OANxCkfTmwf34Hn8HM3uny4g9HFZtEHzO5rrFj2lkrHOjkYe817TYg+oXnK6HvcwDsJm4lG36OUtiqwODZLWZL6gWPVo+0ufzttryQWiolVKiUESolVKiUESoFTKgUGVNSySIOfqYwWyaXdkcMucdb5T5haziNS6QukLg06EG9hmADmkX+0CQeq9krA4FrhcHiFjfmuwe1rvZcNAeLXA3Bv70Hrp5g9gd4jXoeYVSoUsHZsDL3tfXqSplBEqBUioFBErsm5LbHMPmqd3tNBdROP1mDV0Hm3Uj8W4+quNlSp6h8T2yxvLJGPbJG9veY9puHD1QfYCLW9gdqmYnRtnFmzN+jqYx9SUDUj8V3eHQ24grZEBERAREQEREBERAREQeTFsOiqoJKeYZo5GFjxzseYPIg2IPIgL52r8PkpZpaKb+kicWh1rCSPi146EEHpe3JfSi5xvi2dMkLcShb9NTttPbjJS6kk/kEl3kX9EHInKJV6QhwDxwIVgoKFRKqVAoKFQKkVEoIlQKkVAoIlRKkVAoIlQKmVAoIlQKkVEoNi2B2qfhdY2fUwPtHVRjXNFfvAfaaTceo5r6epp2SMbJG4PY9rXse03a5rhcOB8CF8elde3IbZZT81VDtDmdRPceB1L6f73D84eAQdpREQEREBERAREugIsZW7QUUOklTE0/ZztL/0Rr8Fg63eNh8fdMkv5DMo97yEG3qL2BwLSAQQQQdQQeIIXM67eo7hDBG3wMkheT+YwD71reI7wsTk7spjHhFExg977u+KDEbWYCcNrX0tvoH3mpHH/Fk6x38Wm48gDzWBkFirmNVtTUEPmlfI5pJYZJHvI8QL93gOHgFBsgkYHDjzHgUFsqJVSoFBQqJVSolBEqJVSolBEqBUiolBEqBUiolBEqJVSolBQpHI5jg9ji17XNexzdHNe03a4HkQQCqEqBcg+oN3G1rcUoxISBUx2iqmDS0ltJAPsuGo9RyW1r533GNqhimaJruwMEjao2PZhtrx3PDNnAtztmtzX0QgLFYttJQUmlTVwwu+w+RoefJt7n3LKrj+8jd/C6WStjmjD5HGSSGX2SXEalkjfLg73oNhxDe9hMdxG6WpI5RRED9KXKD6XWv1u+d7tKeia3wdNKSfVjQP1lyqSia021afC4I/7+9Gstzug3qq3k4rL+GbCOYhiaB735j8ViKnFqib+mnll6SSPc30BNgsHHIF6GP8EHvbIqulWOknLeOg8QCbe5Q+URk2EmZ1r5QCD7+Xqg9r5wOa876snQXd8VaeCLOc0M6526ehvf3hRknBABc53lGGN4/ad+woITvk5gNHi7h8FYo5wx9swc13G3AHkpTAC1wweGY53H0vf4ryzknhmPpZrf2oMnM2xVoqtLNnZY95uh8fNRKChKiSqlRKCJUSqkqBKChUSqOerTpUEyVBzlAklTjp3O4An7kFsvVLE9PNZrDtnZ5TZrD6Bbvge6+Z9jIMo68UHMoqVzuALvuWxYFsnNO4AxuLbi4bpceBPFdrwbd3Sw2Lm5z14LbaXD4ohZjAPIIMLsTg0dJBkjp44L2L+zBzvIGhe4klx8yVsiAIgLxYhhcM4tIwO8wvaiDnuMbr6SW5YSw9NR7lp2J7qaplzDIHjwOhXc1QhB8x4jsrXQd+B1vEAkfBYaRj2nUEFfWMlOx3EArEYhstRz9+Fh65RdB8wOrpG30za2AGpIVPnJjgc7LWNiCOB8l3XFN1NJJrGXRnobj3Fahi+6epGrHtlAvYO/gbhBzuN8JOZhyO4XBsbeCm90h17UuFtGnQf7tlk8R2Mq4e/TEN1zZAbG4sdRe2nRYKpoDGPoxI02tZ7g7L4WIA+5BcfM4aCNrRbVzBd5PS9lZllZoDncTfvaNH5XJeSKomDsrxpzJH7VekmAFzoPEfwQXaSrax4sR4OazNYDzItfy8FlZfEeawEgPJ3vH8FkaWRwZZ+hHDXl0QeglWnSBeaSe/BUbG53VBcfMrReSvfSYRK82DT6C62vBtgKiWxLCB4uQaMyFzuAJWSosDmkNmtPoF2XBd2cTbGXU+C3TDtnaeEezGB6aoOLYJu3nlsXNyjxcugYLu2p47GT2j8FvzIwOAU0GPocGghFmMA8gve1oHBVRAREQEREBERAREQEREBUIVUQWZKZjuIBWJxDZWkn78LT1sLrOIg5viu6ikkuYy6M9NR7itPxTdJUMuY3Nf01af4LvCoQg+W8Q2IrYT7UL9OYGYfBeY4JO+zOzdp+KV9USUzHcQFYOGRccg9yD55wjYSeQ/0ZHVy3zBd2YFjKfQLqEdKxvAK8AgwGGbKU0IFmC/iQs3HA1vAK6iAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiD/2Q==",
    ),
    Product(
      name: "Celular",
      price: 8000,
      image: "https://tse4.mm.bing.net/th/id/OIP.2MkBh6xJcCQfe8vbqqPJowHaE7?rs=1&pid=ImgDetMain&o=7&rm=3",
    ),
    Product(
      name: "Audífonos",
      price: 500,
      image: "https://tse3.mm.bing.net/th/id/OIP.TcQB_NuA4iKORXFub1x1bwHaHa?rs=1&pid=ImgDetMain&o=7&rm=3",
    ),
    Product(
      name: "Mouse Gamer",
      price: 300,
      image: "https://tse2.mm.bing.net/th/id/OIP.J_uZV6G-RtGKvBMpwLhY9QHaHa?rs=1&pid=ImgDetMain&o=7&rm=3",
    ),
    Product(
      name: "Camara Dijital",
      price: 10000,
      image: "https://tse2.mm.bing.net/th/id/OIP.q2gOhgFIIGB7j1HjtB-hsAHaGM?rs=1&pid=ImgDetMain&o=7&rm=3",
    ),
    Product(
      name: "Television",
      price: 5847,
      image: "https://www.elizondoenlinea.com/images/thumbs/28160441_0_390.jpg",
    ),
    Product(
      name: "Horno Microondas",
      price: 2500,
      image: "https://cantia.com.mx/cdn/shop/files/M9929_46446166-422d-4f35-9492-9ee344960839.png?v=1715297096",
    ),
    Product(
      name: "Aire Acondicionado ",
      price: 7822,
      image: "https://tse4.mm.bing.net/th/id/OIP.Tj7-E7vfuPhhqP4rw_QVGgHaFA?rs=1&pid=ImgDetMain&o=7&rm=3",
    ),

  ];

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("CompraFácil"),
        centerTitle: true,
        elevation: 0,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const CartScreen(),
                    ),
                  );
                },
              ),
              Positioned(
                right: 6,
                top: 6,
                child: CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.red,
                  child: Text(
                    cart.items.length.toString(),
                    style: const TextStyle(fontSize: 10),
                  ),
                ),
              )
            ],
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (_, i) {
            return ProductCard(product: products[i]);
          },
        ),
      ),
    );
  }
}