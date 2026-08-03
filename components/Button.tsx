import Link from "next/link";
import { ReactNode } from "react";

type Variant = "primary" | "accent" | "outline";

interface ButtonProps {
  href: string;
  children: ReactNode;
  variant?: Variant;
  external?: boolean;
  className?: string;
}

const base =
  "inline-flex items-center justify-center gap-2 h-11 px-5 rounded-[10px] text-[15px] font-semibold transition-all duration-200";

const variants: Record<Variant, string> = {
  primary: "bg-navy text-cream hover:bg-navy-dark",
  accent: "bg-brown text-cream hover:bg-brown-dark hover:shadow-[0_4px_12px_rgba(139,94,60,0.25)]",
  outline: "border-[1.5px] border-brown text-brown bg-transparent hover:bg-brown/10",
};

export default function Button({
  href,
  children,
  variant = "primary",
  external = false,
  className = "",
}: ButtonProps) {
  const classes = `${base} ${variants[variant]} ${className}`;

  if (external) {
    return (
      <a href={href} target="_blank" rel="noopener noreferrer" className={classes}>
        {children}
      </a>
    );
  }

  return (
    <Link href={href} className={classes}>
      {children}
    </Link>
  );
}
